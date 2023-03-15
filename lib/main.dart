import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:star_vegas/src/controller/app_conditions.dart';
import '/src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  String dat = await AppConditions.builder();
  runApp(App(data: dat));
}
