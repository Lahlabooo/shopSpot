import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/FetchCatProductsCubit/fetch_cat_products_cubit.dart';
import 'home_widgets/cat_product_item_list.dart';
import 'home_widgets/cat_product_view_app_bar.dart';

class CatProductView extends StatelessWidget {
  const CatProductView({super.key, required this.title, required this.value});
  final String title;
  final FetchCatProductsCubit value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: value,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 25,),
              CatProductViewAppBar(
                title: title,
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(child: CatProductItemList()),
            ],
          ),
        ),
      ),
    );
  }
}