import 'package:equatable/equatable.dart';
import 'package:flutter_ecomerce_ui/presentation/home/models/home_response.dart';

enum HomeStatus { initial, loading, loaded, failure }

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

// ignore: must_be_immutable
class HomeLoadedState extends HomeState {
  HomeResponse homeResponse;

  HomeLoadedState(this.homeResponse);

  @override
  List<Object?> get props => [homeResponse];
}

class HomeLoadFailure extends HomeState {}

/// Loading
// class HomeLoading extends HomeState {}
//
// /// Adready data
// class HomeLoaded extends HomeState {
//   final HomeResponse homeResponse;
//
//   const HomeLoaded({required this.homeResponse});
//
//   @override
//   List<Object?> get props => [homeResponse];
// }
//
// /// Failure
// class HomeLoadFailure extends HomeState {
//   final String error;
//
//   const HomeLoadFailure(this.error);
