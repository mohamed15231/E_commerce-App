import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/login_screen/screens/login_screen.dart';
import 'package:shop_app/shared/component/constant.dart';
import 'package:shop_app/shared/network/bloc.dart';
import 'package:shop_app/shared/network/cache_helper.dart';
import 'package:shop_app/shared/network/dio_helper.dart';

import 'layout/shop_app_layout/shop_app_home.dart';
import 'modules/onboardingscreen/onboardingscreen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  Widget widget=OnBoardingScreen();
  bool? isOnboarding=await CacheHelper.getData(key: onboarding);
  token=await CacheHelper.getData(key: tokenCache);
  print(token);
  if(isOnboarding!=null){
    if(token!=null){
      widget=ShopAppHome();
    }else{
      widget=LoginScreen();
    }
  }else{
    widget=OnBoardingScreen();
  }

  runApp( MyApp(widget:widget ,));
}

class MyApp extends StatelessWidget {
   MyApp({super.key, required this.widget});

   final Widget widget;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:themeData,
      home: widget,
    );
  }
}
