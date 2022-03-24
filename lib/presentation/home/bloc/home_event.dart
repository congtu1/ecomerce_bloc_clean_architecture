import 'package:equatable/equatable.dart';

class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeLoadEvent extends HomeEvent {}

class HomeRefreshEvent extends HomeEvent {}
