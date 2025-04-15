import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/search_model.dart';
import 'package:shop_app/modules/search_screen/cubit_search/states_search.dart';
import 'package:shop_app/shared/network/dio_helper.dart';

import '../../../shared/endPoints.dart';

class CubitSearch extends Cubit<SearchStates> {
  CubitSearch():super(InitialSearchState());
  CubitSearch get(context)=>BlocProvider.of(context);
  
  GetSearchModel? getSearchModel;
  
  void getSearchData(String search){
    emit(LoadingSearchState());
    DioHelper.postData(data: {"text":search}, url: SearchUrl).then((value){
      getSearchModel =GetSearchModel.fromJson(value.data);
      print(getSearchModel!.data!.data![1].image);
      print(getSearchModel!.data!.data![1].name);
      print(getSearchModel!.data!.data![1].price);
      print(getSearchModel!.data!.data![1].id);
      emit(SuccessSearchState());
    }).catchError((error){
      print(error.toString());
      emit(ErrorSearchState(error));
    });
    
  }
  
}