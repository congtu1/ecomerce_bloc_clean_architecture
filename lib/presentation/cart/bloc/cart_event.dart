part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class CartSubscriptionRequest extends CartEvent {
  const CartSubscriptionRequest();

  @override
  List<Object?> get props => [];
}

class CartItemIncrement extends CartEvent {
  const CartItemIncrement(this.item);

  final CartItemModel item;

  @override
  // TODO: implement props
  List<Object?> get props => [item];
}

class CartItemDecrement extends CartEvent {
  const CartItemDecrement(this.item);

  final CartItemModel item;

  @override
  // TODO: implement props
  List<Object?> get props => [item];
}
