part of 'cart_bloc.dart';

class CartState extends Equatable {
  const CartState({
    this.status = BlocStatus.initial,
    this.carts = const [],
  });

  final BlocStatus status;
  final List<CartItemModel> carts;

  CartState copyWith({BlocStatus? status, List<CartItemModel>? carts}) {
    return CartState(status: status ?? this.status, carts: carts ?? this.carts);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, carts];
}
