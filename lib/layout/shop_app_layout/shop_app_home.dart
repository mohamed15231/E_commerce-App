import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/shop_cubit.dart';
import 'package:shop_app/layout/cubit/shop_states.dart';
import 'package:shop_app/modules/search_screen/widgets/search_screen.dart';

import '../../shared/component/constant.dart';
import '../../shared/component/shared widget.dart';

class ShopAppHome extends StatelessWidget {
  const ShopAppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)  =>ShopAppCubit()..getHomeData()..getCategoryData()..getFavoriteItems()..getProfileItem(),

      child: BlocConsumer<ShopAppCubit,ShopAppStates>(
        listener: (context, state) {

        },
        builder: (context,state) {
          var cubit=ShopAppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading:false,
              title: Text("Sala", style: TextStyle(color: Colors.black)),
              actions: [
               IconButton(onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(),));
               }, icon: Icon(Icons.search),
               color: Colors.black,)
              ],
            ),
            body: cubit.screen[cubit.currentIndex],

            bottomNavigationBar: BottomNavigationBar(
              currentIndex:cubit.currentIndex,
              onTap: (value) {
              cubit.onTapBottomNav(index: value);
              },
              items: [BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label: "category"),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: "favorite"),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: "settings"),
              ],
            ),
          );
        }
      ),
    );
  }
}
