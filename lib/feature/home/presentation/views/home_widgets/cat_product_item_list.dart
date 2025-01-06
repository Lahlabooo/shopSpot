import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/FetchCatProductsCubit/fetch_cat_products_cubit.dart';
import '../../manager/FetchCatProductsCubit/fetch_cat_products_state.dart';
import 'card_list_item.dart';


class CatProductItemList extends StatelessWidget {
  const CatProductItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchCatProductsCubit, ProductsCatStates>(
      builder: (BuildContext context, state) {
        if (state is CatProductFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else if (state is CatProductSuccess) {
          return CardListItem(
            itemCount: FetchCatProductsCubit.get(context).catProductList.length,
            P: FetchCatProductsCubit.get(context).catProductList,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
