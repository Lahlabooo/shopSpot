import 'package:flutter/material.dart';
import 'package:shopspot/core/utilis/app_assets.dart';
import 'package:shopspot/core/utilis/app_style.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({super.key, required this.img, required this.title});
final String img;
  final String title;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Container(
      decoration: AppStyle.boxDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 25,),
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image(
              width: size.width*.38,height: size.height*.2,
              image: AssetImage(img),
              fit: BoxFit.fill,
            ),
          ),
          Spacer(),
          Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image(
                    width: size.width*.2,height: size.height*.16,
                    image: AssetImage(AppAssets.discountImg,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Spacer(),
              Text(title,style: AppStyle.textStyle25,),
            ],
          )


        ],
      ),
    );
  }
}
