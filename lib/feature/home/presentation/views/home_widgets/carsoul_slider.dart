import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopspot/core/utilis/app_assets.dart';
import 'package:shopspot/core/utilis/constants.dart';

import 'carousel_item.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: AppAssets.homeCarouselImages.length,
      itemBuilder: (context, index, realIndex) => CarouselItem(
        img: AppAssets.homeCarouselImages[index], title: carouselImgTitle[index],
      ),
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: .8,
        //aspectRatio: 2.5,
      ),
    );
  }
}
