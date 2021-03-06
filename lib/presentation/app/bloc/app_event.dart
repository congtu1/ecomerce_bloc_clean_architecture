import 'package:equatable/equatable.dart';
import 'package:flutter_ecomerce_ui/presentation/app/bloc/app_state.dart';

abstract class AppEvent extends Equatable {}

// ignore: must_be_immutable
class AppRoutePush extends AppEvent {
  AppRoutePush(this.route, [this.data]);

  final AppRoute route;
  dynamic data;

  @override
  // TODO: implement props
  List<Object?> get props => [route, data];
}

class AppRoutePop extends AppEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
