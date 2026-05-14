import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../core/app_services/local_services/cache_helper.dart';
import '../core/app_services/local_services/cache_token.dart';

class CreateRequestWebView extends StatefulWidget {
  const CreateRequestWebView({super.key});

  @override
  State<CreateRequestWebView> createState() => _CreateRequestWebViewState();
}

class _CreateRequestWebViewState extends State<CreateRequestWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      // هنا بنستقبل البيانات من الـ JS
      ..addJavaScriptChannel(
        'Flutter',
        onMessageReceived: (JavaScriptMessage message) async {
          final text = message.message;

          if (text.contains("request ID")) {

            // استخراج الرقم
            final requestId =
            text.replaceAll("request ID:", "").trim();

            // حفظه
            await CacheHelper.saveData(
              key: "requestID",
              value: requestId,
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Saved ID: $requestId"),
              ),
            );

            print("Saved Request ID: $requestId");
          }
        },
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            print("Start: $url");
          },
          onPageFinished: (url) async {
            print("Finished: $url");

            // هنا بنسمع الـ console أو API response
            await controller.runJavaScript("""
  const oldLog = console.log;

  console.log = function(...args) {

    oldLog.apply(console, args);

    const message = args.join(' ');

    Flutter.postMessage(message);
  };
""");
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
          "https://new.easydealmasr.com/iframe/stepper-modal?userId=${CacheHelper.getData(key: "userId")}&token=${CacheTokenManger.userToken}&theme=flutter&preselect=true&scope=inside-compound&transactionType=sell&unitType=apartment",
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Request")),
      body: WebViewWidget(controller: controller),
    );
  }
}
