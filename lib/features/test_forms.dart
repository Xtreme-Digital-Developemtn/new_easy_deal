import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../core/app_services/local_services/cache_helper.dart';
import '../core/app_services/local_services/cache_token.dart';

class CreateRequestWebView extends StatefulWidget {
  const CreateRequestWebView({super.key});

  @override
  State<CreateRequestWebView> createState() =>
      _CreateRequestWebViewState();
}

class _CreateRequestWebViewState
    extends State<CreateRequestWebView> {

  late final WebViewController controller;

  bool redirected = false;

  @override
  void initState() {
    super.initState();

    _initWebView();
  }

  Future<void> _initWebView() async {

    final userId = CacheHelper.getData(
      key: "userId",
    );

    final token = Uri.encodeComponent(
      CacheTokenManger.userToken ?? "",
    );

    final initialUrl =
        "https://new.easydealmasr.com/iframe/stepper-modal"
        "?userId=$userId"
        "&token=$token"
        "&theme=flutter"
        "&preselect=true"
        "&scope=inside-compound"
        "&transactionType=sell"
        "&unitType=apartment";

    controller = WebViewController()

      ..setJavaScriptMode(
        JavaScriptMode.unrestricted,
      )

      ..setNavigationDelegate(

        NavigationDelegate(

          onPageStarted: (url) {

            debugPrint(
              "PAGE START => $url",
            );
          },

          onPageFinished: (url) async {

            debugPrint(
              "PAGE FINISHED => $url",
            );

            // مراقبة console.log
            await controller.runJavaScript("""

              (function() {

                if(window.consoleInjected) {
                  return;
                }

                window.consoleInjected = true;

                const oldLog = console.log;

                console.log = function(...args) {

                  oldLog.apply(console, args);

                  const message = args.join(' ');

                  Flutter.postMessage(message);
                };

              })();

            """);
          },

          onWebResourceError: (error) {

            debugPrint(
              "WEB ERROR => ${error.description}",
            );
          },
        ),
      )

      ..addJavaScriptChannel(

        'Flutter',

        onMessageReceived: (
            JavaScriptMessage message,
            ) async {

          final text = message.message;

          debugPrint(
            "JS MESSAGE => $text",
          );

          // منع التكرار
          if (redirected) return;

          // التقاط request ID
          if (text.contains("request ID:")) {

            redirected = true;

            try {

              final requestId = text
                  .replaceAll(
                "request ID:",
                "",
              )
                  .trim();

              debugPrint(
                "REQUEST ID => $requestId",
              );

              // حفظ الـ ID
              await CacheHelper.saveData(
                key: "requestID",
                value: requestId,
              );

              final redirectUrl =
                  "https://new.easydealmasr.com/iframe/broker-assignment/$requestId"
                  "?userId=$userId"
                  "&token=$token";

              debugPrint(
                "REDIRECT URL => $redirectUrl",
              );

              // التحويل داخل نفس الـ session
              await controller.runJavaScript("""

                window.location.href = "$redirectUrl";

              """);

              if (mounted) {

                ScaffoldMessenger.of(context)
                    .showSnackBar(

                  SnackBar(
                    content: Text(
                      "Request ID: $requestId",
                    ),
                  ),
                );
              }

            } catch (e) {

              debugPrint(
                "ERROR => $e",
              );
            }
          }
        },
      )

      ..loadRequest(
        Uri.parse(initialUrl),

        headers: {

          "Authorization":
          "Bearer ${CacheTokenManger.userToken}",

          "Accept": "application/json",

          "Content-Type":
          "application/json",
        },
      );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Create Request",
        ),
      ),

      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}