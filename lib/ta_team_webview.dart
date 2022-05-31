// ignore_for_file: prefer_const_constructors
import "package:flutter/material.dart";
import 'package:webview_flutter/webview_flutter.dart';

class TATeamWebview extends StatefulWidget {
  const TATeamWebview({Key? key}) : super(key: key);

  @override
  State<TATeamWebview> createState() => _TATeamWebviewState();
}

class _TATeamWebviewState extends State<TATeamWebview> {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: "https://www.tech-academy.io/team/",
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
