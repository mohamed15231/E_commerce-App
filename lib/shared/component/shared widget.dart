import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/layout/cubit/shop_cubit.dart';

import '../../style/color.dart';


Widget buildProductFavorite({
  required  product,
  required BuildContext context,
  bool oldPrice =true,
}){

      return Container(
        color: Colors.white,
        height: 200,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Image.network(
                      "${product.image}",
                      height: 200,
                    ),
                    if (product.discount != 0 && oldPrice)
                      Container(
                        color: Colors.red,
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "Discount",
                          style: TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "${product.name}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          "${product.price}",
                          textAlign: TextAlign.end,
                          style: TextStyle(color: Colors.blue),
                        ),
                        SizedBox(width: 5),
                        if (product.discount != 0 && oldPrice)
                          Text(
                            "${product.old_price}",
                            textAlign: TextAlign.end,

                            style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor:
                            ShopAppCubit.get(context).favoriteMap[product.id]!
                                ? Colors.blue
                                :
                            Colors.grey,
                            radius: 20,
                            child: IconButton(
                              onPressed: () {
                                ShopAppCubit.get(context).changeFavoriteButton(
                                  productId: product.id!,
                                );
                              },
                              icon: Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
                height: 2,
              ),


            ],
          ),
        ),
      );
}


Widget defaultTextFormField({
  TextInputType? inputType,
  Function(String)? submitted,
  Function(String)? onChange,
  String? Function(String?)? validator,
  required String label,
  required IconData prefix,
  required TextEditingController Controller,
  Widget? suffixIcon,
  bool isPassword=false,
}){
  return TextFormField(
      keyboardType: inputType,
      style: TextStyle(
          fontWeight: FontWeight.bold
      ),
      onFieldSubmitted:submitted,
      onChanged: onChange,
      validator:validator,
      controller:Controller,
      obscureText: isPassword,
      decoration:InputDecoration(
        contentPadding: EdgeInsets.all(20),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red
            )
          ),
          suffixIcon:suffixIcon ,
          focusedBorder:OutlineInputBorder(
              borderSide: BorderSide(
                  color: primary_color,
                width: 2
              )
          ) ,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 2,
                color: Colors.grey
              )
          ),
          label: Text(label),

          prefixIcon: Icon(prefix)
      )
  );
}

Widget defaultElevatedButton({
  required Function()? onPressed,
  required String text,

}){
  return Container(
    width: double.infinity,
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10)
    ),
    child: ElevatedButton(onPressed: onPressed,
        style: ButtonStyle(
        ),
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
              color: Colors.white,
              fontSize: 20
          ),
        )),
  );
}

Widget defaultTextButton({
  required String text,
  required Function()? onPressed,

}){
  return TextButton(onPressed: onPressed,
      child: Text(text.toUpperCase(),style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: primary_color
      )));}



enum ToastState{error,warn,success}

Future<bool?> showMessage({
  required String msg,
  required ToastState state,
}){


  return  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor( state),
      textColor: Colors.white,
      fontSize: 16.0
  );

}


Color chooseToastColor(ToastState state){

  Color color;

  switch(state){
    case ToastState.success:
     color=Colors.green;
      break;


    case ToastState.error:
      color=Colors.red;
      break;
    case ToastState.warn:
      color= Colors.amber;
      break;
  }
  return color;


}