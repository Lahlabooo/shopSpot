import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/product_entity.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.P,
    this.onPressed,
    required this.color,
  });
  final ProductEntity P;
  final void Function()? onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
                offset: Offset(2, 10),
              ),
            ],
          ),
          child: CardWidget(
            P: P,
            color: color,

            onPressed: onPressed,
          ),
        ),
        Positioned(
            bottom: 90,
            left: 100,
            child: CachedNetworkImage(
              imageUrl: P.productImg,
              width: 80,
              height: 130,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            )),
      ],
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.P,
    this.onPressed,
    required this.color,
  });

  final ProductEntity P;
  final void Function()? onPressed;
  final Color color;


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              P.productTitle.substring(0, 9),
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${P.productPrice}" r'$',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    Icons.favorite_sharp,
                    color:color,
                    size: 30,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
