import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/product_entity.dart';
import '../../../domain/use_cases/fetch_category_products_use_case.dart';
import 'fetch_cat_products_state.dart';

class FetchCatProductsCubit extends Cubit<ProductsCatStates> {
  FetchCatProductsCubit (this.fetchProductsUseCase) : super (InitialCatProduct());
  static FetchCatProductsCubit get(context) => BlocProvider.of<FetchCatProductsCubit>(context);
  final FetchCatProductsUseCase fetchProductsUseCase;
  List<ProductEntity> catProductList = [];
  Future<void> fetchCatProduct({required String catName})async{
    emit(CatProductLoading());
    var result = await fetchProductsUseCase.call(catName);
    result.fold(
          (l) {
        emit(CatProductFailure(errMessage: l.errMessage));
      },
          (r) {
        catProductList = r;
        emit(CatProductSuccess());
      
      },

    );
  }

}