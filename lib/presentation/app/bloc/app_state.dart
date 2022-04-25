import 'package:equatable/equatable.dart';

enum AppRoute {
  splash,
  home,
  login,
  register,
  productDetail,
  cart,
  menu,
  initial
}

class AppState extends Equatable {
  const AppState({this.parameter, required this.listRoute});

  final dynamic parameter;
  final List<AppRoute> listRoute;

  AppState copyWith({dynamic parameter, List<AppRoute>? listRoute}) {
    return AppState(
        parameter: parameter, listRoute: listRoute ?? this.listRoute);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [parameter, listRoute];
}
