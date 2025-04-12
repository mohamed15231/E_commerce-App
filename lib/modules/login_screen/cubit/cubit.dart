import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/login_screen/cubit/states.dart';
import 'package:shop_app/shared/endPoints.dart';
import 'package:shop_app/shared/network/dio_helper.dart';

import '../../../models/login_model.dart';

class LoginShopCubit extends Cubit<LoginShopStates>{
  LoginShopCubit():super(InitialShopStates());

  static LoginShopCubit get(context)=>BlocProvider.of(context);
  bool isShow=false;
  IconData icon=Icons.remove_red_eye_outlined;

  LoginModel? loginModel;
  void changeShowPassword(){
    isShow=!isShow;
    icon=isShow?Icons.visibility_off_outlined:Icons.remove_red_eye_outlined;
    emit(ChangeIconShopStates());

  }

  void loginData({
    required String email,
    required String password,
}){
    emit(LoadingLoginShopStates());
    DioHelper.postData(data: {
      "email":email,
      "password":password,
    }, url: loginUrl).then((value){

      loginModel=LoginModel.mapJson(value.data);
      print(loginModel?.status);
      print(loginModel?.message);
      print(loginModel?.data?.token);
      emit(SuccessLoginShopStates());
    }).catchError((value){
      print(value.toString());
      emit(ErrorLoginShopStates(value));

    });
  }

}