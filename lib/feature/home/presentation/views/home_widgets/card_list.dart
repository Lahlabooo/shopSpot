import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopspot/feature/home/domain/entities/product_entity.dart';
import '../../../../../core/cubits/firebase_cubit/firebase_cubit.dart';
import '../../../../../core/functions/is_favourite.dart';
import '../../../../../core/utilis/constants.dart';
import '../../manager/FetchProductsCubit/fetch_product_cubit.dart';
import '../../manager/FetchProductsCubit/fetch_product_states.dart';
import 'custom_card.dart';

class CustomCardList extends StatelessWidget {
  const CustomCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchProducts, ProductsStates>(
      builder: (BuildContext context, state) {
        if (state is ProductFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.errMessage),
            ),
          );
        } else if (state is ProductSuccess) {
          final P = FetchProducts.get(context).productList;
          return CustomSliverGrid(P: P);
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

class CustomSliverGrid extends StatelessWidget {
  const CustomSliverGrid({
    super.key,
    required this.P,
  });

  final List<ProductEntity> P;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return FavStreamBuilder(P: P,index: index,);
        },
        childCount: FetchProducts.get(context).productList.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 70,
        childAspectRatio: 1.1, // Aspect ratio for each item
      ),
    );
  }
}

class FavStreamBuilder extends StatelessWidget {
  const FavStreamBuilder({
    super.key,
    required this.P, required this.index,
  });

  final List<ProductEntity> P;
final int index ;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: isFav(id: P[index].productId), // Your asynchronous function
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(), // Loading indicator
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          // When the asynchronous operation completes
          final bool isFav = snapshot.data!;

          return CustomCard(
            P: P[index],
            color: isFav?Colors.red:Colors.grey,
            onPressed: () {
              snapshot.data!? FirebaseCubit.get(context).deleteData(email: appEmail, id: P[index].productId):
              FirebaseCubit.get(context).insertData(email: appEmail, item:P[index]);
            },

          );
        }
      },
    );
  }
}

