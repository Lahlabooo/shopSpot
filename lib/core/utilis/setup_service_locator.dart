import 'package:get_it/get_it.dart';
import 'package:shopspot/core/utilis/supabase_services.dart';
import 'package:shopspot/feature/login/data/repos/login_repo.dart';
import 'package:shopspot/feature/login/data/repos/login_repo_impl.dart';
import '../../feature/home/data/data_source/home_local_data.dart';
import '../../feature/home/data/data_source/home_remote_data.dart';
import '../../feature/home/data/repos/home_repo_impl.dart';
import '../../feature/home/domain/use_cases/fetch_category_products_use_case.dart';
import '../../feature/home/domain/use_cases/fetch_product_use_case.dart';
import 'api_services.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<FetchProductsUseCase>(FetchProductsUseCase(
      homeRepo: HomeRepoImpl(
          HomeRemoteData(apiServices: ApiServices()), HomeLocalData())));
  getIt.registerSingleton<LoginRepo>(
      LoginRepoImpl(subabaseServices: SubabaseServices()));
  getIt.registerSingleton<FetchCatProductsUseCase>(FetchCatProductsUseCase(
      homeRepo: HomeRepoImpl(
          HomeRemoteData(apiServices: ApiServices()), HomeLocalData())));
}
