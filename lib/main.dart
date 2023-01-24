import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/core/inject/inject.dart';
import 'package:movieapp/features/movie/presentation/ui/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setWindowSizeDesktop();
  Inject.inicialize();
  runApp(const MyApp());
}

setWindowSizeDesktop() async {
  if (Platform.isWindows) {
    await DesktopWindow.setWindowSize(
        Size(392.72727272727275, 803.6363636363636));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
