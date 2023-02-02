import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewStack extends StatefulWidget {
  const WebViewStack({required this.controller, super.key});

  final WebViewController controller;

  @override
  State<WebViewStack> createState() => _WebViewStackState();
}

/* wrap WebView widget in a Stack */
class _WebViewStackState extends State<WebViewStack> {
  var loadingPercent = 0;

  @override
  void initState() {
    super.initState();

    widget.controller.setNavigationDelegate(NavigationDelegate(
      onPageStarted: (url) {
        setState(() {
          loadingPercent = 0;
        });
      },
      onProgress: (progress) {
        setState(() {
          loadingPercent = progress;
        });
      },
      onPageFinished: (url) {
        setState(() {
          loadingPercent = 100;
        });
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(controller: widget.controller),
        if (loadingPercent < 100)
          LinearProgressIndicator(
            value: loadingPercent / 100.0,
          )
      ],
    );
  }
}
