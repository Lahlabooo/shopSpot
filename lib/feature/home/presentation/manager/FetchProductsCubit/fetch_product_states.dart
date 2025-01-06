
abstract class ProductsStates {}


class InitialProduct extends ProductsStates {}
class ProductLoading extends ProductsStates {}
class ProductSuccess extends ProductsStates {
}
class ProductFailure extends ProductsStates {
  final String errMessage ;

  ProductFailure({required this.errMessage});

}