class GetFavoriteModel{
  bool? status;
  DataFavorite? data;
  GetFavoriteModel.fromJson(Map<String,dynamic> json){
    status =json['status'];
    data =DataFavorite.fromJson(json['data']);
  }

}


class DataFavorite{
  List<DataList>? data=[];
  DataFavorite.fromJson(Map<String,dynamic> json){
    json["data"].forEach((element){
      data!.add(DataList.fromJson(element));
    });
  }
}

class DataList{
  Product? productFavorite ;
  DataList.fromJson(Map<String,dynamic> json){

    productFavorite=Product.fromJson(json['product']);


  }
}

class Product{
  int? id ;
  dynamic price ;
  dynamic old_price ;
  dynamic discount ;
  String? image ;
  String? name ;
  Product.fromJson(Map<String,dynamic> json){

    id=json['id'];
    price=json['price'];
    old_price=json['old_price'];
    discount=json['discount'];
    image=json['image'];
    name=json['name'];

  }
}