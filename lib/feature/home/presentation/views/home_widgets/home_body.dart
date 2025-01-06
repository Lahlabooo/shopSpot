import 'package:flutter/material.dart';
import 'package:shopspot/feature/home/presentation/views/home_widgets/carsoul_slider.dart';
import 'card_list.dart';
import 'card_product_list.dart';
import 'custom_divider.dart';
import 'home_app_bar.dart';

class Homebody extends StatelessWidget {
  const Homebody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: const [
              SizedBox(
                height: 45,
              ),
              HomeAppBar(),
              SizedBox(
                height: 25,
              ),
              CustomCarouselSlider(),
              SizedBox(
                height: 25,
              ),
              CustomDivider(),
              CatProductList(),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
        CustomCardList(),
      ],
    );
  }
}
