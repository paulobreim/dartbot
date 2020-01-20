import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

var teledart = teleDart();

TeleDart teleDart() => TeleDart(
    Telegram('1036713538:AAHmbczOl5VAy0PMhgK02Cq5g4onUqxNB5I'), Event());

Future<String> trataComando (var message) async {
String m1, m2, saida;

int t;

m1 = message.text;
t = m1.indexOf(' ');

if  (t == -1) {
  saida = 'nenum comando digitado';
 
} else {

  m2 = m1.substring(t,m1.length).trim();
  saida = 'você digitou [' + m2 + ']';

}

 await teledart.replyMessage(message, saida);
 await teledart.replyLocation(message, -23.34241, -46.3234234);

await teledart.replyPhoto(
          message,
          'https://flutterando.com.br/wp-content/uploads/2019/06/flutterando_logo.png',
          caption: 'Título');


 return(saida);

}


void main() async {

    await teledart.start().then((me) => print('${me.username} pronto pra trabalhar'));

    teledart
          .onCommand('hello')
           .listen(((message) => teledart.replyMessage(message, 'world')));

    teledart
      .onMessage(entityType: 'bot_command')
      .where((message) =>
      '/teste' == (message.getEntity('bot_command').toLowerCase()))
      .listen((message) => {
         
         trataComando (message),

      });



}