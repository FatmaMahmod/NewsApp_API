import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class cach_helper{
  static SharedPreferences sherdprefrences;
  static  init() async{
    sherdprefrences = await SharedPreferences.getInstance() ;
  }
 static Future<bool>  putData({
    @required String key,
    @required bool value,
})async{
    return await sherdprefrences.setBool(key, value);
  }
  static getData({
    @required String key
}){
    return sherdprefrences.getBool(key);
  }
}