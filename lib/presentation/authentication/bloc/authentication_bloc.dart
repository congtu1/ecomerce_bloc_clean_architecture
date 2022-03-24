import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecomerce_ui/common/navigator_service/navigator_service.dart';

import 'package:flutter_ecomerce_ui/data_layer/models/models.dart';
import 'package:flutter_ecomerce_ui/data_layer/repository/auth/auth_repo_imlp.dart';

import 'package:flutter_ecomerce_ui/presentation/Widgets/show_exception.dart';
import 'package:flutter_ecomerce_ui/presentation/authentication/bloc/authentication_events.dart';
import 'package:flutter_ecomerce_ui/presentation/authentication/bloc/authentication_states.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent,AuthenticationState> {
  AuthenticationBloc({required AuthRepoImpl authenticationRepository})
    : _authenticationRepository = authenticationRepository, super(const AuthenticationState.unknown()) {
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
          (status) => add(AuthenticationStatusChanged(status)),
    );
  }


  final AuthRepoImpl _authenticationRepository;

  late StreamSubscription<AuthenticationStatus> _authenticationStatusSubscription;

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    // _authenticationRepository.dispose();
    return super.close();
  }

  void _onAuthenticationStatusChanged(
      AuthenticationStatusChanged event,
      Emitter<AuthenticationState> emit,
      ) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return emit(const AuthenticationState.unauthenticated());
      case AuthenticationStatus.authenticated:
        User? user;
        try {
          user = await _tryGetUser();
        } catch (e) {
          showException(
              NavigationService.navigatorKey.currentContext, e.toString());
          user = User.empty;
        }
        return emit(user != User.empty
            ? AuthenticationState.authenticated(user!)
            : const AuthenticationState.unauthenticated());
      default:
        return emit(const AuthenticationState.unknown());
    }
  }

  //Logout
  void _onAuthenticationLogoutRequested(
      AuthenticationLogoutRequested event,
      Emitter<AuthenticationState> emit,
      ) {
    _authenticationRepository.signOut();
  }

  //Get current user
  Future<User?> _tryGetUser() async {
    final user = await _authenticationRepository.getCurrentUser();
    return user;
  }
}