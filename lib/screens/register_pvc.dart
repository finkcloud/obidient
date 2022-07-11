import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../main.dart';

class RegisterForPVC extends StatefulWidget {
  const RegisterForPVC({Key? key}) : super(key: key);

  @override
  _RegisterForPVCState createState() => _RegisterForPVCState();
}

class _RegisterForPVCState extends State<RegisterForPVC> {
  WebViewController? _controller;
  final Completer<WebViewController> _controllerCompleter =
      Completer<WebViewController>();

  // final Completer<WebViewController> _controller =
  //     Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  Future<bool> _goBack(BuildContext context) async {
    if (await _controller!.canGoBack()) {
      _controller!.goBack();
      return Future.value(false);
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Return Home'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('No, still here'),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const MainScreen(title: '🗳️ PO 4 PRESIDENT')),
                      );
                    },
                    child: const Text('Yes please'),
                  ),
                ],
              ));
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    String useragent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36";

    return WillPopScope(
      onWillPop: () => _goBack(context),
      child: Scaffold(
        body: SafeArea(
          child: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: 'https://cvr.inecnigeria.org/Public/getStarted',
            userAgent: useragent,
            onWebViewCreated: (WebViewController webViewController) {
              _controllerCompleter.future.then((value) => _controller = value);
              _controllerCompleter.complete(webViewController);
            },
          ),
        ),
      ),
    );
  }
}
