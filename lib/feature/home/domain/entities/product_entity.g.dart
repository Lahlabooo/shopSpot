// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductEntityAdapter extends TypeAdapter<ProductEntity> {
  @override
  final int typeId = 1;

  @override
  ProductEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductEntity(
      productTitle: fields[0] as String,
      productPrice: fields[1] as num,
      productId: fields[2] as num,
      caption: fields[3] as String,
      productCat: fields[4] as String,
      productImg: fields[5] as String,
      productRating: fields[6] as num,
    );
  }

  @override
  void write(BinaryWriter writer, ProductEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.productTitle)
      ..writeByte(1)
      ..write(obj.productPrice)
      ..writeByte(2)
      ..write(obj.productId)
      ..writeByte(3)
      ..write(obj.caption)
      ..writeByte(4)
      ..write(obj.productCat)
      ..writeByte(5)
      ..write(obj.productImg)
      ..writeByte(6)
      ..write(obj.productRating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
