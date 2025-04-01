
import 'dart:io';

class Environment {

  static String apiUrl = Platform.isAndroid ? '10.0.2.2:3000' : 'localhost:3000';

  static String socketUrl = Platform.isAndroid ? '10.0.2.2:3000' : 'localhost:3000'; 
}