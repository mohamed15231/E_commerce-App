class HomeModel {
  bool? status;
  DataModel? data;
  HomeModel.fromJson(Map<String,dynamic> json){
    status=json["status"];
    data=DataModel.fromJson(json["data"]);

  }

}

class DataModel{
  List<BannersData> banners=[];
  List<ProductsData> products=[];
  DataModel.fromJson(Map<String,dynamic> json){
  json["banners"].forEach((elements){
    banners.add(BannersData.fromJson(elements));
  });

  json["products"].forEach((elements){
    products.add(ProductsData.fromJson(elements));
  });
  }
}

class BannersData{
  int? id;
  String? image;
  BannersData.fromJson(Map<String,dynamic> json){
    id=json["id"];
    image=json["image"];
  }
}

class ProductsData{
  int? id;
  dynamic price;
  dynamic old_price;
  dynamic discount;
  String? image;
  String? name;
  String? description;
  bool? inFavorite;
  ProductsData.fromJson(Map<String,dynamic> json){
    id=json["id"];
    price=json["price"];
    old_price=json["old_price"];
    discount=json["discount"];
    image=json["image"];
    name=json["name"];
    description=json["description"];
    inFavorite=json["in_favorites"];
  }
}