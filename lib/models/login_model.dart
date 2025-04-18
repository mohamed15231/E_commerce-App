class LoginModel{

  bool? status;
  String? message;
  DataLoginModel? data;
  LoginModel.mapJson(Map<String,dynamic>? json){
    status=json?["status"];
    message=json?["message"];
    data=json?["data"]!=null? DataLoginModel.mapJson(json?["data"]) : null;
}


}

class DataLoginModel{

  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;
  DataLoginModel.mapJson(Map<String,dynamic>? json){
    id=json?["id"];
    name=json?["name"];
    email=json?["email"];
    phone=json?["phone"];
    image=json?["image"];
    points=json?["points"];
    credit=json?["credit"];
    token=json?["token"];
}
}