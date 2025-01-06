import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/product_entity.dart';
import 'card_list.dart';

class CardListItem extends StatefulWidget {
  const CardListItem({
    super.key,
    required this.itemCount,
    required this.P,
  });

  final int itemCount;
  final List<ProductEntity> P;

  @override
  State<CardListItem> createState() => _CardListItemState();
}
class _CardListItemState extends State<CardListItem> {
  late Stream<bool> favoriteStreams;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: widget.P.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 70,
        childAspectRatio: 1.1,
      ),
      itemBuilder: (context, index) {
        return FavStreamBuilder(P: widget.P,index: index,);
      },
    );
  }
}
