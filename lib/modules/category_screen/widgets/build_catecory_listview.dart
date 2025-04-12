import 'package:flutter/material.dart';
import 'package:shop_app/models/categories_model.dart';

Widget buildListCategory(DataListCategory category){
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image.network(
          "${category.image}",
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
        Text(
          "${category.name}",
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_forward_ios),
        ),
      ],
    ),
  );

}