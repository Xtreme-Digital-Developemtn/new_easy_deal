import 'package:webview_flutter/webview_flutter.dart';

import '../main_imports.dart';

class BrokerAssignmentScreenWebView extends StatefulWidget {
  const BrokerAssignmentScreenWebView({super.key, required this.requestId});
  final String requestId;

  @override
  State<BrokerAssignmentScreenWebView> createState() =>
      _BrokerAssignmentScreenWebViewState();
}

class _BrokerAssignmentScreenWebViewState
    extends State<BrokerAssignmentScreenWebView> {

  late final WebViewController controller;

  bool redirected = false;

  @override
  void initState() {
    super.initState();

    final userId = CacheHelper.getData(key: "userId");

    final token =
      CacheTokenManger.userToken ?? "";

    final initialUrl =
        "https://new.easydealmasr.com/iframe/broker-assignment/${widget.requestId}"
        "?userId=$userId"
        "&token=$token";

    controller = WebViewController()

      ..setJavaScriptMode(
        JavaScriptMode.unrestricted,
      )

    // استقبال الرسائل من JavaScript
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

          // التحقق من وجود request ID
          if (text.contains("request ID:")) {

            redirected = true;

            try {

              // استخراج الـ ID
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

              // الانتقال للشاشة الجديدة
              if (mounted) {

                print("mostafa & nourhan");
              }

            } catch (e) {

              debugPrint(
                "ERROR => $e",
              );
            }
          }
        },
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

    // تحميل أول صفحة
      ..loadRequest(
        Uri.parse(initialUrl),
      );
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
