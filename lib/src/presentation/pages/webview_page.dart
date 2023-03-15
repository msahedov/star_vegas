import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import '../widgets/network_error_widget.dart';

class AppWebView extends StatefulWidget {
  final String url;
  const AppWebView({super.key, required this.url});

  @override
  State<AppWebView> createState() => _AppWebViewState();
}

class _AppWebViewState extends State<AppWebView> {
  late final WebViewController _controller;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));

    ///Save url in local storage
    ///
    _prefs.then((preferences) {
      _saveUrl(preferences);
    });

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: checkNetwork(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.data == false) {
            return NetwotkErrorWidget(onPressed: () {
              setState(() {
                _controller.reload();
              });
            });
          } else {
            return WillPopScope(
              key: const Key('app_webview_pop_button'),
              onWillPop: _onWillPopScope,
              child: SafeArea(child: WebViewWidget(controller: _controller)),
            );
          }
        });
  }

  Future<bool> checkNetwork() async {
    try {
      var result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) return true;
    } on SocketException catch (_) {
      return false;
    } catch (_) {
      return false;
    }
    return false;
  }

  _saveUrl(SharedPreferences? preferences) async {
    var urls = preferences?.getStringList('urls');
    urls?.add(widget.url);
    preferences?.setStringList('urls', urls ?? []).then((value) =>
        value ? debugPrint("Succesfully saved!") : debugPrint("Error"));
  }

  Future<bool> _onWillPopScope() async {
    if (await _controller.canGoBack()) {
      await _controller.goBack();
    }
    return false;
  }
}
