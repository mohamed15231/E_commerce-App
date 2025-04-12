class GetSearchModel{
  bool? status;
  DataList? data;
  GetSearchModel.fromJson(Map<String,dynamic> json){
    status =json['status'];
    data =DataList.fromJson(json['data']);
  }

}


class DataList{
  List<Product>? data=[];
  DataList.fromJson(Map<String,dynamic> json){
    json["data"].forEach((element){
      data!.add(Product.fromJson(element));
    });
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