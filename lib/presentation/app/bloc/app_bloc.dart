import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_ecomerce_ui/presentation/app/bloc/app_event.dart';
import 'package:flutter_ecomerce_ui/presentation/app/bloc/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState(route: AppRoute.initial)) {
    on<AppEventNavigator>(_onEventPush);
  }

  Future<void> _onEventPush(
      AppEventNavigator event, Emitter<AppState> emit) async {
    emit(state.copyWith(event.route, event.data));
  }
}
