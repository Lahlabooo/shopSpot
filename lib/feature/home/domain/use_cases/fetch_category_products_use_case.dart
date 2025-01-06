import 'package:dartz/dartz.dart';
import '../../../../core/app_errors/app_errors.dart';
import '../../../../core/app_use_case/use_case_with_params.dart';
import '../entities/product_entity.dart';
import '../repos/home_repo.dart';


class FetchCatProductsUseCase extends UseCaseWithParams <List<ProductEntity>,String>{
  final HomeRepo homeRepo;

  FetchCatProductsUseCase({required this.homeRepo});
  @override
  Future<Either<AppErrors, List<ProductEntity>>> call(catName) async{

    return await homeRepo.fetchCatProducts(catName:catName );
  }

}