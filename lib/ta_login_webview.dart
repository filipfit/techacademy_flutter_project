// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TALoginWebview extends StatefulWidget {
  const TALoginWebview({Key? key}) : super(key: key);

  @override
  State<TALoginWebview> createState() => _TALoginWebviewState();
}

class _TALoginWebviewState extends State<TALoginWebview> {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: "https://www.tech-academy.io/login/",
      javascriptMode: JavascriptMode.unrestricted,
      navigationDelegate: (NavigationRequest req) {
        if (req.url.contains("tech-academy.io")) {
          return NavigationDecision.navigate;
        }
        return NavigationDecision.prevent;
      },
    );
  }
}
