import 'package:shared_preferences/shared_preferences.dart';


class Preferences {
  static late SharedPreferences _prefs;

  static String _name = '';
  static bool _isDarkmode = false;
  static int _gender = 1;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }


  static String get name{
    return _prefs.getString('name') ?? _name;
  }

  static set name(String name){
    _name = name;
    _prefs.setString('name', name);
  }


  static bool get isDarkmode{
    return _prefs.getBool('isDarkmode') ?? _isDarkmode;
  }

  static set isDarkmode(bool darkmode){
    _isDarkmode = darkmode;
    _prefs.setBool('isDarkmode', darkmode);
  }


  static int get gender{
    return _prefs.getInt('gender') ?? _gender;
  }

  static set gender(int gender){
    _gender = gender;
    _prefs.setInt('gender', gender);
  }
  
}