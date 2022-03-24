import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecomerce_ui/domain/usescases/auth_usecases.dart';
import 'package:formz/formz.dart';

import '../../../common/navigator_service/navigator_service.dart';
import '../../Widgets/show_exception.dart';
import '../model/models.dart';
import 'login_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authUseCase) : super(const LoginState());

  final AuthUseCase _authUseCase;

  void nameChanged(String value) {
    final name = Name.dirty(value);
    emit(state.copyWith(name: name, status: Formz.validate([name])));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([
          password,
        ]),
      ),
    );
  }

  void confirmPasswordChanged(String value) {
    final cPass =
        ConfirmedPassword.dirty(password: state.password.value, value: value);
    emit(state.copyWith(status: Formz.validate([state.password, cPass])));
  }

  Future<void> login() async {
    if (state.status.isValid) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        var data = {
          "email": state.email.value,
          "password": state.password.value
        };

        await _authUseCase.signIn(data);
      } catch (e) {
        showException(
            NavigationService.navigatorKey.currentContext, e.toString());
        emit(state.copyWith(
            status: FormzStatus.submissionFailure, errorMessage: e.toString()));
      }
    }
  }

  Future<void> register() async {
    if (state.status.isValid) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        var data = {
          'name': state.name.value,
          "email": state.email.value,
          "password": state.password.value,
          'c_password': state.password.value,
        };

        await _authUseCase.register(data);
      } catch (e) {
        emit(state.copyWith(
            status: FormzStatus.submissionFailure, errorMessage: e.toString()));
      }
    } else {
      emit(state.copyWith(status: FormzStatus.invalid));
    }
  }
}
