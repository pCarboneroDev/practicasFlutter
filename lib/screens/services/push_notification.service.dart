// SAH1: 4B:47:A5:7F:B6:1C:33:10:95:F7:C5:55:1F:E8:EA:78:BD:BC:DF:BC

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStream = new StreamController.broadcast(); 
  static Stream<String> get messagesStream => _messageStream.stream;


  static Future _backGroundHandler(RemoteMessage msg) async {
    //print('background Handler ${msg.messageId}');
    _messageStream.add(msg.notification?.title ?? 'No title');
  }

  static Future _onMessageHandler(RemoteMessage msg) async {
    //print('_onMessageHandler ${msg.messageId}');
    print(msg.data);
      _messageStream.add(msg.data['product'] ?? 'No data');
  }

  static Future _onMessageOpenApp(RemoteMessage msg) async {
    //print('_onMessageOpenApp ${msg.messageId}');
     _messageStream.add(msg.data['product'] ?? 'No data');
  }

  static Future initializeApp() async {
    //push notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();

    print('token: $token');

    //Handlers
    FirebaseMessaging.onBackgroundMessage(_backGroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    //local notifications
  }

  static closeStreams(){
    _messageStream.close();
  }

}