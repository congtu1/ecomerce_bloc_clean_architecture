import 'package:equatable/equatable.dart';

enum AppRoute { splash, home, login, register, productDetail, cart, initial }

class AppState extends Equatable {
  const AppState({required this.route, this.parameter});

  final AppRoute route;
  final dynamic parameter;

  AppState copyWith(AppRoute? route, [dynamic parameter]) {
    return AppState(
      route: route ?? this.route,
      parameter: parameter,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [route, parameter];
}
