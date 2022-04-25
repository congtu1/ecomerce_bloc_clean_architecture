import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecomerce_ui/common/bloc_status/bloc_status.dart';
import 'package:flutter_ecomerce_ui/common/injector/injector.dart';
import 'package:flutter_ecomerce_ui/data_layer/repository/cart/cart_repository_imlp.dart';

import '../../../data_layer/models/cart_item_model.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<CartSubscriptionRequest>(_onSubscriptionRequested);
    on<CartItemIncrement>(_onIncrementAmount);
    on<CartItemDecrement>(_onDecrementAmount);
  }

  final _cartRepository = getIt.get<CartRepositoryImlp>();

  Future<void> _onSubscriptionRequested(
    CartSubscriptionRequest event,
    Emitter<CartState> emit,
  ) async {
    emit(state.copyWith(status: BlocStatus.loading));
    await emit.forEach<List<CartItemModel>>(
      _cartRepository.getCartStream(),
      onData: (carts) => state.copyWith(
        status: BlocStatus.success,
        carts: carts,
      ),
      onError: (_, __) => state.copyWith(
        status: BlocStatus.failure,
      ),
    );
  }

  Future<void> _onIncrementAmount(
    CartItemIncrement event,
    Emitter<CartState> emit,
  ) async {
    _cartRepository.incrementAmount(event.item);
  }

  Future<void> _onDecrementAmount(
    CartItemDecrement event,
    Emitter<CartState> emit,
  ) async {
    _cartRepository.decrementAmount(event.item);
  }
}
