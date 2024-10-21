import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

import '../env/env.dart';

class TelegramManager{
  static final String botToken = Env.telegramApiKey;
  static String? username;
  static TeleDart? teledart;
  static Future<void> init() async {
    teledart = TeleDart(botToken, Event(username!));
    username = (await Telegram(botToken).getMe()).username;

    teledart!.onMessage(entityType: 'bot_command', keyword: 'start')
        .listen(onStart);
    teledart!.onCommand('glory')
        .listen(onGlory);
    teledart!.start();
  }

  static void onStart(var message){
    teledart!.sendMessage(message.chat.id, 'Hello TeleDart!');
  }

  static void onGlory(var message){
    message.reply('to Ukraine!');
  }

}