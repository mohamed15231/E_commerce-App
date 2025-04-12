
class CategoriesModel{
  bool? status;
  DataCategoryModel? data;
  CategoriesModel.fromJson(Map<String,dynamic> model){
    status =model["status"];
    data =DataCategoryModel.fromJson(model["data"]);
  }
}


class DataCategoryModel{
  int? currentPage;
  List<DataListCategory> data=[];
  DataCategoryModel.fromJson(Map<String,dynamic> model){
    currentPage=model['current_page'];
    model['data'].forEach((element){
     data.add(DataListCategory.fromJson(element));
    });
  }
}


class DataListCategory{

  int? id;
  String? name;
  String? image;
  DataListCategory.fromJson(Map<String,dynamic>model){
    id=model['id'];
    name=model['name'];
    image=model['image'];
  }
}

