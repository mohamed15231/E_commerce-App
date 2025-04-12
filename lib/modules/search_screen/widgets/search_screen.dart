import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/component/shared%20widget.dart';

import '../../../layout/cubit/shop_cubit.dart';
import '../cubit_search/cubit_search.dart';
import '../cubit_search/states_search.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: MultiBlocProvider(
        providers: [BlocProvider(
          create: (context) => ShopAppCubit(),
    ),
    BlocProvider(create: (context) => CubitSearch(),)
    ],
        child: BlocConsumer<CubitSearch, SearchStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = CubitSearch().get(context);
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  defaultTextFormField(
                    label: "Search",
                    prefix: Icons.search,
                    submitted: (value) {
                      cubit.getSearchData(value);
                    },
                    Controller: searchController,
                  ),
                  if(state is LoadingSearchState)
                    LinearProgressIndicator(),

                  if(state is SuccessSearchState)
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context,index) {
                          return buildProductFavorite(product: cubit.getSearchModel?.data!.data![index], context: context);
                        }, separatorBuilder: (BuildContext context, int index) =>Divider(
                        height: 2,
                        color: Colors.grey,
                      ), itemCount: cubit.getSearchModel!.data!.data!.length,
                      ),
                    )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
