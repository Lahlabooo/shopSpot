
import 'package:hive_flutter/adapters.dart';

import '../../feature/home/domain/entities/product_entity.dart';
class HiveServices {
static const String kProducts = "productBox";
  static saveProductsData ({required List<ProductEntity> products})  {
    var box =  Hive.box<ProductEntity>(kProducts);
    box.addAll(products);
  }
}