
import 'package:hive_flutter/adapters.dart';

part 'product_entity.g.dart';

@HiveType(typeId: 1)
class ProductEntity {
  @HiveField(0)
  String productTitle;
  @HiveField(1)
  final num productPrice;
  @HiveField(2)
  final num productId;
  @HiveField(3)
  final String caption;
  @HiveField(4)
  final String productCat;
  @HiveField(5)
  final String productImg;
  @HiveField(6)
  final num productRating;
  @HiveField(7)
  ProductEntity(
      {
    required this.productTitle,
    required this.productPrice,
    required this.productId,
    required this.caption,
    required this.productCat,
    required this.productImg,
        required this.productRating
  });
  factory ProductEntity.fromJson(json ){
    return ProductEntity(
        productTitle: json["title"],
        productPrice: json["price"],
        productId: json["id"],
        caption: json["caption"],
        productCat: json["category"],
        productImg: json["img"],
        productRating: json["rating"],
    );
  }

}