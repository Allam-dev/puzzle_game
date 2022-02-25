import 'package:flutter/material.dart';
import 'package:hack_puzzle/injection.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'presentation/app/app.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await injectionSetUp();
  runApp(const App());
}
