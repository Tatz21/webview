import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WillPopScope(
        onWillPop: () async {
          String url = await controller.currentUrl();
          if (url ==
              'https://gocharting.com/optionsdesk?underlying=NSE:NIFTY') {
            return true;
          } else {
            controller.goBack();
            return false;
          }
        },
        child: Scaffold(
          body: Container(
            child: SafeArea(
              child: WebView(
                initialUrl:
                    'https://gocharting.com/optionsdesk?underlying=NSE:NIFTY',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController wc) {
                  controller = wc;
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
