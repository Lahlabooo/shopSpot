
import '../../../../core/utilis/api_services.dart';
import '../../domain/entities/product_entity.dart';
import '../models/product_model.dart';

class HomeRemoteData {
  final ApiServices apiServices;

  HomeRemoteData({required this.apiServices});
  Future<List<ProductEntity>>fetchProducts() async{
    return await fetchProductData(endPoint:"products");
  }
  //.............................................................
  Future<List<ProductEntity>>fetchCatProducts({required String catName}) async{
    return await fetchProductData(endPoint:"products/category/$catName");
  }

  Future<List<ProductEntity>> fetchProductData({required String endPoint}) async {
    List<ProductEntity> productList = [];
     var products = await apiServices.get(endPoint: endPoint);
       for (var product in products){
     productList.add(ProductModel.fromJson(product) as ProductEntity);

       }
       //HiveServices.saveProductsData(products: productList);
    return  productList;
  }
}