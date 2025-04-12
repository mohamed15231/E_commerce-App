import 'package:flutter/material.dart';
import 'package:shop_app/modules/login_screen/screens/login_screen.dart';
import 'package:shop_app/shared/network/cache_helper.dart';

import '../../style/color.dart';

ThemeData themeData=ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
  backgroundColor: Colors.white,
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
    selectedLabelStyle: TextStyle(
      color: Colors.blue
    ),
    type: BottomNavigationBarType.fixed

  ),
    appBarTheme: AppBarTheme(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.blue
        ),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        foregroundColor: Colors.transparent,
        scrolledUnderElevation: 0
      // color: Colors.transparent
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            textStyle: WidgetStatePropertyAll(TextStyle(
                color: primary_color
            ))
        )
    ),
    primaryColor: primary_color,
    actionIconTheme: ActionIconThemeData(),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primary_color,


    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style:ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(primary_color),
          shape: WidgetStateProperty.all(LinearBorder()),
          fixedSize: WidgetStatePropertyAll<Size>(
            Size(100, 55)
          ),
          padding: WidgetStatePropertyAll(EdgeInsets.all(10))
      ),

    ),
    scaffoldBackgroundColor: Colors.white,
    buttonTheme: ButtonThemeData(

    )
);


void logout({
required BuildContext context}){
  token="";
  CacheHelper.removeData(key: tokenCache);
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
}



String? token;

String onboarding="onboarding";
String tokenCache="token";