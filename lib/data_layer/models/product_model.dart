import 'package:equatable/equatable.dart';
import 'package:flutter_ecomerce_ui/domain/entities/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends ProductEntity implements Equatable {
  ProductModel(
      {required int id,
      required int idShop,
      required int idCategory,
      required String name,
      required String description,
      required double price,
      required String thumbnail,
      required String image})
      : super(
            id, idShop, idCategory, name, description, price, thumbnail, image);

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, idShop, idCategory, name, description, price, thumbnail, image];

  @override
  // TODO: implement stringify
  bool? get stringify => true;
}
