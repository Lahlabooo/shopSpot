
import 'package:hive_flutter/adapters.dart';

import '../../../../core/utilis/hive_services.dart';
import '../../domain/entities/product_entity.dart';

class HomeLocalData {
  Future<List<ProductEntity>> fetchProducts() async{
    var box = Hive.box<ProductEntity>(HiveServices.kProducts);
    return  box.values.toList();
  }
}