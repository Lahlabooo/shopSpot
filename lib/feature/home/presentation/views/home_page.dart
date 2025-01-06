import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopspot/core/utilis/app_router.dart';

import '../../../../core/cubits/firebase_cubit/firebase_cubit.dart';
import '../../../../core/utilis/constants.dart';
import '../../../../core/utilis/setup_service_locator.dart';
import '../../../../core/widgets/bottom_nav_bar.dart';
import '../../domain/use_cases/fetch_category_products_use_case.dart';
import '../../domain/use_cases/fetch_product_use_case.dart';
import '../manager/FetchCatProductsCubit/fetch_cat_products_cubit.dart';
import '../manager/FetchProductsCubit/fetch_product_cubit.dart';
import 'home_widgets/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeBloc());
  }
}

class HomeBloc extends StatelessWidget {
  const HomeBloc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                FetchProducts(getIt.get<FetchProductsUseCase>())
                  ..fetchProduct(),
          ),
          BlocProvider(
            create: (context) =>
                FetchCatProductsCubit(getIt.get<FetchCatProductsUseCase>()),
          ),
        ],
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Homebody(),
            BottomNavBar(
              onTap: (index) {
                if (index == 0) {
                } else if (index == 2) {
                  FirebaseCubit.get(context).getData(email: appEmail);
                  GoRouter.of(context).push(AppRouter.kFavouriteView);
                } else {}
              },
            ),
          ],
        ));
  }
}
