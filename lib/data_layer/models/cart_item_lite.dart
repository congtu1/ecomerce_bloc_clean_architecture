import 'package:json_annotation/json_annotation.dart';

part 'cart_item_lite.g.dart';

@JsonSerializable()
class CartItemLite {
  final int id;
  final int idProduct;
  final int status;

  CartItemLite(this.id, this.idProduct, this.status);

  factory CartItemLite.fromJson(Map<String, dynamic> json) =>
      _$CartItemLiteFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemLiteToJson(this);
}
