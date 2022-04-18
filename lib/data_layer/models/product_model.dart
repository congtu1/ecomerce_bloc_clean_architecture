import 'package:equatable/equatable.dart';
import 'package:flutter_ecomerce_ui/domain/entities/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends ProductEntity implements Equatable {
  ProductModel(
      {required int id,
      required String name,
      required String image,
      required double price})
      : super(id, name, image, price);

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, image, price];

  @override
  // TODO: implement stringify
  bool? get stringify => true;
}
