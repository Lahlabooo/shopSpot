import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopspot/core/utilis/app_router.dart';
import 'package:shopspot/feature/home/presentation/manager/FetchCatProductsCubit/fetch_cat_products_cubit.dart';
import '../../../../../core/utilis/app_style.dart';

class CatProductItem extends StatelessWidget {
  const CatProductItem({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 18),
      child: InkWell(
        onTap: () {
          FetchCatProductsCubit.get(context).fetchCatProduct(catName: title);
          GoRouter.of(context).push(
            AppRouter.kCatProductView,
            extra: {
              'title'  : title,
              'value': FetchCatProductsCubit.get(context)
            },
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: AppStyle.boxDecoration,
          child: Center(
            child: Text(
              title,
              style: AppStyle.textStyle18,
            ),
          ),
        ),
      ),
    );
  }
}
