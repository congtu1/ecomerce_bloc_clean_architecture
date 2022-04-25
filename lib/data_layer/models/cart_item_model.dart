import 'package:flutter_ecomerce_ui/domain/entities/cart_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_item_model.g.dart';

@JsonSerializable()
class CartItemModel extends CartItemEntity {
  CartItemModel(
      {required int id,
      required String name,
      required String image,
      required double price,
      required int amount,
      required int paymentStt})
      : super(id, name, image, price, amount, paymentStt);

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);

  CartItemModel copyWith(
      {int? id,
      String? name,
      String? image,
      double? price,
      int? amount,
      int? paymentStt}) {
    return CartItemModel(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        price: price ?? this.price,
        amount: amount ?? this.amount,
        paymentStt: paymentStt ?? this.paymentStt);
  }
}
