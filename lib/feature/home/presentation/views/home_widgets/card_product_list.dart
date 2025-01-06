import 'package:flutter/cupertino.dart';

import '../../../../../core/utilis/constants.dart';
import 'cat_product_item.dart';

class CatProductList extends StatelessWidget {
  const CatProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,physics: BouncingScrollPhysics(),
        itemCount: catProductItemTitle.length,
        itemBuilder: (context, index) => CatProductItem(title: catProductItemTitle[index],),
      ),
    );
  }
}
