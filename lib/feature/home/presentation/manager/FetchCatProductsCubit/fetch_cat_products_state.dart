
abstract class ProductsCatStates {}


class InitialCatProduct extends ProductsCatStates {}
class CatProductLoading extends ProductsCatStates {}
class CatProductSuccess extends ProductsCatStates {
}
class CatProductFailure extends ProductsCatStates {
  final String errMessage ;

  CatProductFailure({required this.errMessage});

}