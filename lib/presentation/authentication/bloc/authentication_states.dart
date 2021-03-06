import 'package:equatable/equatable.dart';
import 'package:flutter_ecomerce_ui/data_layer/models/models.dart';


enum AuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated,
}
class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user = User.empty,
});

final AuthenticationStatus status;
final User user;

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  @override
  // TODO: implement props
  List<Object?> get props => [status,user];

}