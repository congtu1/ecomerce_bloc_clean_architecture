import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_ecomerce_ui/presentation/app/bloc/app_event.dart';
import 'package:flutter_ecomerce_ui/presentation/app/bloc/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState(listRoute: [AppRoute.initial])) {
    on<AppRoutePush>(_onEventPush);
    on<AppRoutePop>(_onEventPop);
  }

  Future<void> _onEventPush(AppRoutePush event, Emitter<AppState> emit) async {
    List<AppRoute> list = state.listRoute.map((e) => e).toList();
    list.add(event.route);
    emit(state.copyWith(parameter: event.data, listRoute: list));
  }

  Future<void> _onEventPop(AppRoutePop event, Emitter<AppState> emit) async {
    List<AppRoute> list = state.listRoute.map((e) => e).toList();
    if (list.isEmpty) {
    } else {
      list.removeLast();
      emit(state.copyWith(listRoute: list));
    }
  }
}
