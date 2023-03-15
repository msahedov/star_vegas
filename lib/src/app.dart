import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'presentation/pages/webview_page.dart';
import 'controller/bindings.dart';
import 'presentation/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key, required this.data});
  final String data;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: const Color(0xff030218),
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarIconBrightness: ThemeData.estimateBrightnessForColor(
          const Color(0xff030218),
        ),
      ),
      child: GetMaterialApp(
        initialBinding: AppBindings(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: data.isEmpty ? const HomePage() : AppWebView(url: data),
      ),
    );
  }
}
