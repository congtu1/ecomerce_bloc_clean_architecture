import 'package:equatable/equatable.dart';
import 'package:flutter_ecomerce_ui/presentation/login/model/email.dart';
import 'package:flutter_ecomerce_ui/presentation/login/model/name.dart';
import 'package:flutter_ecomerce_ui/presentation/login/model/password.dart';
import 'package:formz/formz.dart';

class LoginState extends Equatable {
  const LoginState({
    this.name = const Name.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
  });

  final Email email;
  final Name name;
  final Password password;
  final FormzStatus status;
  final String? errorMessage;

  @override
  List<Object> get props => [name,email, password, status];

  LoginState copyWith({
    Name? name,
    Email? email,
    Password? password,
    FormzStatus? status,
    String? errorMessage,
  }) {
    return LoginState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}