import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/login_screen/cubit/states.dart';
import 'package:shop_app/modules/rigister_screen/cubit/register_states.dart';
import 'package:shop_app/shared/endPoints.dart';
import 'package:shop_app/shared/network/dio_helper.dart';

import '../../../models/login_model.dart';

class RegisterShopCubit extends Cubit<RegisterShopStates>{
  RegisterShopCubit():super(InitialRegisterShopStates());

  static RegisterShopCubit get(context)=>BlocProvider.of(context);
  bool isShow=false;
  IconData icon=Icons.remove_red_eye_outlined;

  LoginModel? loginModel;
  void changeShowPassword(){
    isShow=!isShow;
    icon=isShow?Icons.visibility_off_outlined:Icons.remove_red_eye_outlined;
    emit(ChangeIconRegisterStates());

  }

  void loginData({
    required String email,
    required String name,
    required String phone,
    required String password,
  }){
    emit(LoadingRegisterShopStates());
    DioHelper.postData(data: {
      "email":email,
      "name":name,
      "password":password,
      "phone":phone,
    }, url: registerUrl).then((value){

      loginModel=LoginModel.mapJson(value.data);
      print(loginModel?.status);
      print(loginModel?.message);
      print(loginModel?.data?.token);
      emit(SuccessRegisterShopStates());
    }).catchError((value){
      print(value.toString());
      emit(ErrorRegisterShopStates(value));

    });
  }

}