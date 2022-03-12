
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecomerce_ui/data_layer/repository/auth/auth_repo_imlp.dart';
import 'package:flutter_ecomerce_ui/data_layer/repository/auth/authentication_respository.dart';
import 'package:flutter_ecomerce_ui/presentation/login/bloc/login_state.dart';
import 'package:flutter_ecomerce_ui/presentation/login/model/email.dart';
import 'package:flutter_ecomerce_ui/presentation/login/model/name.dart';
import 'package:flutter_ecomerce_ui/presentation/login/model/password.dart';
import 'package:formz/formz.dart';
import 'package:http/http.dart';

class LoginCubit extends  Cubit<LoginState> {
  LoginCubit(this._authenticationRepository) : super(const LoginState());

  final AuthRepoImpl _authenticationRepository;


  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email, state.email]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([password,state.email]),
      ),
    );
  }

  Future<void> login() async {
    Response res;
    if(state.status.isValid) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        var data = {
          "email" : state.email.value,
          "password" : state.password.value
        };

        await _authenticationRepository.signIn(data);
      }
      catch (e) {
        emit(state.copyWith(status: FormzStatus.submissionFailure,errorMessage: e.toString()));
      }
    }
  }


}