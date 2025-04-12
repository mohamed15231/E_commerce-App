class ChangeFavoriteButton{
    String? message;
    bool? status;
  ChangeFavoriteButton.fromJson(Map<String,dynamic> json ){
    message=json['message'];
    status=json['status'];
  }


}