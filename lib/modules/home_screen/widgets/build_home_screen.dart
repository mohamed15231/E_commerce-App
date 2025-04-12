import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/shop_cubit.dart';
import 'package:shop_app/layout/cubit/shop_states.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/models/home_model.dart';

Widget buildHomeScreen({
  required HomeModel homeModel,
  required CategoriesModel category,
}) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          items:
              homeModel.data!.banners
                  .map(
                    (elements) => Image(
                      image: NetworkImage("${elements.image}"),
                      fit: BoxFit.cover,
                    ),
                  )
                  .toList(),
          options: CarouselOptions(
            autoPlay: true,
            reverse: false,
            viewportFraction: 1,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Category",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 10),

              SizedBox(
                height: 100,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder:
                      (context, index) =>
                          buildCategoryGridView(category.data!.data[index]),
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemCount: category.data!.data.length,
                ),
              ),
              SizedBox(height: 10),

              Text(
                "Products",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 20),
              Container(
                color: Colors.grey[300],
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  childAspectRatio: 1 / 1.7,
                  children: List.generate(
                    homeModel.data!.products.length,
                    (index) =>
                        buildProductsGridView(homeModel.data!.products[index]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildProductsGridView(ProductsData product) {
  return BlocConsumer<ShopAppCubit,ShopAppStates>(
    listener: (context, state) {

    },
    builder: (context,state) {
      var cubit=ShopAppCubit.get(context);
      return Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image.network("${product.image}", height: 200),
                if (product.discount != 0)
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
            SizedBox(height: 5),
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
                if (product.discount != 0)
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
                    backgroundColor:cubit.favoriteMap[product.id]! ? Colors.blue :Colors.grey,
                    radius: 20,
                    child: IconButton(
                      onPressed: () {
                        cubit.changeFavoriteButton(productId:product.id!);
                      },
                      icon: Icon(Icons.favorite_border,color: Colors.white,),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 5),
          ],
        ),
      );
    }
  );
}

Widget buildCategoryGridView(DataListCategory category) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 100,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Image.network("${category.image}", width: 100, height: 100),
            Container(
              width: 100,
              color: Colors.black.withOpacity(0.8),
              child: Text(
                "${category.name}",
                style: TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
