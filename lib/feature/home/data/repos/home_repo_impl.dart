import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/app_errors/app_errors.dart';
import '../../../../core/app_errors/server_error.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repos/home_repo.dart';
import '../data_source/home_local_data.dart';
import '../data_source/home_remote_data.dart';

class HomeRepoImpl extends HomeRepo{
  final HomeRemoteData homeRemoteData;
  final HomeLocalData homeLocalData;

  HomeRepoImpl(this.homeRemoteData, this.homeLocalData);
  @override
  Future<Either<AppErrors, List<ProductEntity>>> fetchProducts() async{

   // List<ProductEntity> localProducts =await homeLocalData.fetchProducts();
    //if (localProducts.isNotEmpty) {
   //   return Right(localProducts);
  //  }
    try {
      var productList = await homeRemoteData.fetchProducts();
      return Right(productList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure("oops there are an error, try again later"));
    }
  }

  @override
  Future<Either<AppErrors, List<ProductEntity>>> fetchCatProducts({required String catName}) async{

    try {
      var productList = await homeRemoteData.fetchCatProducts(catName: catName);
      return Right(productList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure("oops there are an error, try again later"));
    }
  }

}