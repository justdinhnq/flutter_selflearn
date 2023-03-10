# webview_in_flutter

WebView Flutter plugin to add a WebView widget to the Android/iOS app
- iOS: WebView widget is backed by a WKWebView
- Android: WebView widget is backed by a WebView

Ref: https://codelabs.developers.google.com/codelabs/flutter-webview#0

## Contents

1. display web content in a WebView
2. display Flutter widgets stacked over it
3. react to page load progress events
4. control it through a controller
5. block websites using a delegate
6. evaluate JavaScript expressions
7. handle callbacks from JavaScript with a channel
8. set, remove, add or show cookies
9. load, display HTML from assets, files or String contain HTMl

## Getting started

1. create a Flutter project
```
$ cd webview_in_flutter
$ flutter run
```

2. add WebView Flutter plugin as a dependency (pubspec.yaml)
```
$ cd webview_in_flutter
$ flutter pub add webview_flutter
```

3. configure Android minSDK (android/app/build.gradle)