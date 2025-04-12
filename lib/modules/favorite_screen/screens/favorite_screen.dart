import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/shop_cubit.dart';
import 'package:shop_app/layout/cubit/shop_states.dart';

import '../../../shared/component/shared widget.dart';
import '../widgets/build_product_favorite.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopAppCubit.get(context);
        return ConditionalBuilder(
          condition: state is! LoadingGetFavoritesScreen && cubit.isLoading !=true &&cubit.homeModel?.data !=null,
            fallback: (context) => Center(child: CircularProgressIndicator()),

            builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.separated(
                itemBuilder:
                    (context, index) => buildProductFavorite(
                      context: context,
                      product:
                          cubit.getFavoriteModel!.data!.data![index].productFavorite!,
                    ),
                separatorBuilder:
                    (context, index) => Divider(height: 2, color: Colors.grey),

                itemCount: cubit.getFavoriteModel!.data!.data!.length,
              ),
            );
          }
        );
      },
    );
  }
}
