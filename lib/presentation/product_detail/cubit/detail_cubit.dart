import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecomerce_ui/common/injector/injector.dart';
import 'package:flutter_ecomerce_ui/domain/usescases/cart_usecase.dart';
import 'package:flutter_ecomerce_ui/presentation/product_detail/cubit/detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit() : super(const ProductDetailState());

  final cartUseCase = getIt.get<CartUseCase>();

  Future<void> addToCart(int idProduct) async {
    return cartUseCase.addToCart(idProduct);
  }
}
