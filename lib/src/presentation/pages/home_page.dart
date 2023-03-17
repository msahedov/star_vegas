import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/counter_widget.dart';
import '../widgets/footer_widget.dart';
import '../widgets/toggle_button.dart';
import '../../presentation/widgets/content_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      key: const Key('home_page_scaffold'),
      appBar: AppBar(
        key: const Key('home_page_appbar'),
        elevation: 0.0,
        backgroundColor: const Color(0xff030218),
        title: AppToggleButton(),
        actions: const [CounterWidget()],
      ),
      body: const ContentWidget(),
      persistentFooterAlignment: AlignmentDirectional.center,
      backgroundColor: const Color(0xff030218),
      persistentFooterButtons: const [FooterWidget()],
    );
  }
}
