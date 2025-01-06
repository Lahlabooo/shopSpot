import 'package:flutter/material.dart';

import 'home_widgets/cat_product_view_app_bar.dart';
import 'home_widgets/fav_item_list.dart';
class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            CatProductViewAppBar(
              title: "Favourite",
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(child: FavItemList()),
          ],
        ),
      ),
    );
  }
}


