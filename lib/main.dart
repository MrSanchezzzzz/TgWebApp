import 'package:flutter/material.dart';
import 'package:tg_web_app/screens/main_screen.dart';
import 'package:tg_web_app/themes.dart';
import 'package:tg_web_app/utils/telegram.dart';

Future<void> main() async {
  runApp(const MyApp());
  TelegramManager.init();
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      darkTheme: FlutterMidnightNeonTheme.lightTheme,
      theme: FlutterMidnightNeonTheme.lightTheme,
      themeMode: ThemeMode.dark,
      home: const MainScreen()
    );
  }
}
