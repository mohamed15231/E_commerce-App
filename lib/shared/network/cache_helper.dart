import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static SharedPreferences? sharedPreferences;

 static init()async{

    sharedPreferences=await SharedPreferences.getInstance();
  }

  static setData({
    required dynamic value,
    required String key,
})async{

   if(value is String){
     sharedPreferences!.setString(key, value);
   }
   if(value is bool){
     sharedPreferences!.setBool(key, value);
   }
   if(value is int){
     sharedPreferences!.setInt(key, value);
   }
   if(value is double){
     sharedPreferences!.setDouble(key, value);
   }
  }


  static dynamic getData({
    required String key,
})async{

   return sharedPreferences!.get(key);
  }
  static Future<bool> removeData({
    required String key,
  })async{

    return sharedPreferences!.remove(key);
  }
}