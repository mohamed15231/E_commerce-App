import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/shop_states.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/models/change_favorite_model.dart';
import 'package:shop_app/models/get_favoritemodel.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/modules/category_screen/screens/category_screen.dart';
import 'package:shop_app/modules/favorite_screen/screens/favorite_screen.dart';
import 'package:shop_app/modules/home_screen/screen/home_screen.dart';
import 'package:shop_app/modules/settings_screen/settings_screen.dart';
import 'package:shop_app/shared/component/constant.dart';
import 'package:shop_app/shared/endPoints.dart';
import 'package:shop_app/shared/network/dio_helper.dart';

import '../../models/login_model.dart';

class ShopAppCubit extends Cubit<ShopAppStates> {
  ShopAppCubit() : super(ShopAppInitialState());

  static ShopAppCubit get(context) => BlocProvider.of(context);
  List<Widget> screen = [
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    SettingsScreen(),
  ];
  int currentIndex = 0;

  void onTapBottomNav({required int index}) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  HomeModel? homeModel;

  Map<int,bool> favoriteMap={};
  void getHomeData() {
    emit(LoadingHomeDataState());
    DioHelper.getData(query: {}, url: homeUrl,).then((value){
      homeModel=HomeModel.fromJson(value.data);

      homeModel!.data!.products.forEach((elements){

        favoriteMap.addAll({elements.id!: elements.inFavorite!});
      });
      print( homeModel!.data!.products[1].inFavorite);

      emit(SuccessHomeDataState());
    }).catchError((error){
      emit(ErrorHomeDataState(error));
    });
  }

  CategoriesModel? categoriesModel;
  void getCategoryData() {
    DioHelper.getData(url: categoriesUrl).then((value){
      categoriesModel=CategoriesModel.fromJson(value.data);
      print(categoriesModel!.data!.data[0].image);
      emit(SuccessCategoryState());
    }).catchError((error){
      emit(ErrorCategoryState(error));
    });
  }

  bool? isLoading;
  ChangeFavoriteButton? changeFavoriteModel;
  void changeFavoriteButton({
    required int productId,
}) {
    isLoading=true;
    favoriteMap[productId] =!favoriteMap[productId]!;
    emit(SuccessChangeFavoriteState());
    DioHelper.postData(url: FavoriteUrl, data: {
      "product_id":productId
    }).then((value){
      changeFavoriteModel=ChangeFavoriteButton.fromJson(value.data);
      if(changeFavoriteModel!.status==false){
        favoriteMap[productId] =!favoriteMap[productId]!;
      }else{
        getFavoriteItems().then((v){
          isLoading=false;

        });

      }
      emit(SuccessChangeFavoriteState());
    }).catchError((error){
      emit(ErrorChangeFavoriteState(error));
    });
  }

GetFavoriteModel? getFavoriteModel;
  Future getFavoriteItems()async{

    await DioHelper.getData(url: FavoriteUrl).then((value){
      getFavoriteModel=GetFavoriteModel.fromJson(value.data);
      emit(SuccessGetFavoritesScreen());
    }).catchError((error){
      emit(ErrorGetFavoritesScreen(error));
      print(error);

    });


  }

  LoginModel? getProfile;
  Future<void> getProfileItem()async{

    await DioHelper.getData(url: ProfileUrl).then((value){
      getProfile=LoginModel.mapJson(value.data);
      print(getProfile!.data!.name);
      emit(SuccessGetProfileScreen());
    }).catchError((error){
      emit(ErrorGetProfileScreen(error));
      print(error);

    });


  }
  LoginModel? updateProfileModel;
  void updateProfile({
    required String name,
    required String phone,
    required String email,
})
  {
    emit(LoadingUpdateSettingsScreen());

    DioHelper.putData(url: UpDateUrl,query: {
      "name":name,
      "phone":phone,
      "email":email,
    }).then((value)async{
      updateProfileModel=LoginModel.mapJson(value.data);
      print(updateProfileModel!.data!.token);
       getProfileItem().then((value){
         token=updateProfileModel!.data!.token;
         emit(SuccessGetProfileScreen());
       });

    }).catchError((error){
      emit(ErrorUpdateSettingsScreen(error));
      print(error);
    });
  }





}
