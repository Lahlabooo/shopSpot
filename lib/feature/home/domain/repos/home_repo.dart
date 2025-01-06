import 'package:dartz/dartz.dart';

import '../../../../core/app_errors/app_errors.dart';
import '../entities/product_entity.dart';

abstract class HomeRepo{
Future<Either<AppErrors,List<ProductEntity>>> fetchProducts();
Future<Either<AppErrors,List<ProductEntity>>> fetchCatProducts({required String catName});
}
