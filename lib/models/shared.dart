import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences _preferences;
  static const _language='selectedLanguage';
  static const _name='name';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

    Future setDialogue(data) async {
    await _preferences.setString(_language, data.toString());
    print("saved");
  }
  Future setName(data) async {
    await _preferences.setString(_name, data.toString());
    print("saved");
  }

   String  getDialogue()=>
     _preferences.getString(_language);

   String  getName()=>
     _preferences.getString(_name);

}