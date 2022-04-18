import 'package:equatable/equatable.dart';
import 'package:flutter_ecomerce_ui/common/bloc_status/bloc_status.dart';

class ProductDetailState extends Equatable {
  const ProductDetailState({this.status = BlocStatus.initial});

  final BlocStatus status;

  ProductDetailState copyWith(BlocStatus? status) {
    return ProductDetailState(status: status ?? this.status);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status];
}
