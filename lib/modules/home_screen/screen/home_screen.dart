import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/shop_cubit.dart';
import 'package:shop_app/layout/cubit/shop_states.dart';

import '../widgets/build_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
      listener: (BuildContext context, ShopAppStates state) {},
      builder: (BuildContext context, ShopAppStates state) {
        var cubit = ShopAppCubit.get(context);
        return ConditionalBuilder(condition: cubit.homeModel?.data != null && cubit.categoriesModel?.data != null,
          builder: (context) => buildHomeScreen(homeModel: cubit.homeModel!,category:cubit.categoriesModel!),
          fallback: (context) =>
              Center(
                child: CircularProgressIndicator(),
              ),);
      },
    );
  }
}
