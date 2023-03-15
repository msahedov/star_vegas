import 'package:flutter/material.dart';

import '../../presentation/widgets/content_widget.dart';
import '../widgets/counter_widget.dart';
import '../widgets/footer_widget.dart';
import '../widgets/toggle_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
