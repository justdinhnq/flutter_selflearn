import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewStack extends StatefulWidget {
  const WebViewStack({super.key});

  @override
  State<WebViewStack> createState() => _WebViewStackState();
}

/* wrap WebView widget in a Stack */
class _WebViewStackState extends State<WebViewStack> {
  var loadingPercent = 0;
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          loadingPercent = 0;
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
      ))
      ..loadRequest(Uri.parse(
          'https://chart-studio.plotly.com/~lamquangthinh.lqt/9.embed'));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(controller: controller),
        if (loadingPercent < 100)
          LinearProgressIndicator(
            value: loadingPercent / 100.0,
          )
      ],
    );
  }
}
