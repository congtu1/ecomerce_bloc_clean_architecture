import 'package:equatable/equatable.dart';

import 'authentication_states.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class AuthenticationStatusChanged extends AuthenticationEvent {
  const AuthenticationStatusChanged(this.status);

  final AuthenticationStatus status;

  @override
  List<Object> get props => [status];
}
// class AuthenticationHaveError extends AuthenticationEvent {
//   const AuthenticationHaveError(this.error);
//   final String error;
// }

class AuthenticationLogoutRequested extends AuthenticationEvent {}
