import 'package:flutter/material.dart';
import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:tg_web_app/screens/main_screen.dart';
import 'package:tg_web_app/themes.dart';
Future<void> main() async {
  runApp(const MyApp());
  var BOT_TOKEN = '8140771829:AAEByf6PRwzGAx_2LMu6DTRTh9LOzWwuXMY';
  final username = (await Telegram(BOT_TOKEN).getMe()).username;
  var teledart = TeleDart(BOT_TOKEN, Event(username!));

  teledart.onMessage(entityType: 'bot_command', keyword: 'start')
      .listen((message) => teledart.sendMessage(message.chat.id, 'Hello TeleDart!'));

// Short way (recommended)
  teledart.onCommand('glory')
      .listen((message) => message.reply('to Ukraine!'));
  teledart.start();
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
