import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/shop_cubit.dart';
import 'package:shop_app/layout/cubit/shop_states.dart';

import '../widgets/build_catecory_listview.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopAppCubit.get(context);
        return ListView.separated(
          itemBuilder: (context, index) {
            return buildListCategory(cubit.categoriesModel!.data!.data[index]);
          },
          separatorBuilder: (context, index) => Container(
            height: 1,
            color: Colors.grey[400],

          ),
          itemCount: cubit.categoriesModel!.data!.data.length,
        );
      },
    );
  }
}
