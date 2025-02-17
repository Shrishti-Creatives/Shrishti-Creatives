import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the WebView controller
    _controller = WebViewController()
      ..setBackgroundColor(Color(0x00000000))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (String url) {
          debugPrint("Page started loading: $url");
        },
        onPageFinished: (String url) {
          debugPrint("Page finished loading: $url");
        },
        onWebResourceError: (WebResourceError error) {
          debugPrint("Error: ${error.description}");
        },
      ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Shrishti Creatives")),
        body: WebViewWidget(controller: _controller),
      ),
    );
  }
}
