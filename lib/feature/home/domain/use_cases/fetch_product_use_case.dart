import 'package:dartz/dartz.dart';
import '../../../../core/app_errors/app_errors.dart';
import '../../../../core/app_use_case/use_case.dart';
import '../entities/product_entity.dart';
import '../repos/home_repo.dart';

class FetchProductsUseCase extends UseCase<List<ProductEntity>> {
  final HomeRepo homeRepo;

  FetchProductsUseCase({required this.homeRepo});
  @override
  Future<Either<AppErrors, List<ProductEntity>>> call() async {
    return await homeRepo.fetchProducts();
  }
}
