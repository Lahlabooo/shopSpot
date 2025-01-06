import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/product_entity.dart';
import '../../../domain/use_cases/fetch_product_use_case.dart';
import 'fetch_product_states.dart';

class FetchProducts extends Cubit<ProductsStates> {
  FetchProducts (this.fetchProductsUseCase) : super (InitialProduct());
static FetchProducts get(context) => BlocProvider.of<FetchProducts>(context);
final FetchProductsUseCase fetchProductsUseCase;
List<ProductEntity> productList = [];
Future<void> fetchProduct()async{
  emit(ProductLoading());

  var result = await fetchProductsUseCase.call();
 result.fold(
     (l) {
       emit(ProductFailure(errMessage: l.errMessage));

     },
     (r) {
       productList = r;
       emit(ProductSuccess());
     },

 );
}

}