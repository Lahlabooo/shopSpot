import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopspot/core/cubits/firebase_cubit/firebase_cubit.dart';

import 'card_list_item.dart';

class FavItemList extends StatelessWidget {
  const FavItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirebaseCubit, FirebaseState>(
        builder: (BuildContext context, state) {
      if (FirebaseCubit.get(context).favProducts.isEmpty) {
        return Center(child: Text("noFav"));
      }
      return CardListItem(
        itemCount: FirebaseCubit.get(context).favProducts.length,
        P: FirebaseCubit.get(context).favProducts,
      );
    });
  }
}
