import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecomerce_ui/common/injector/injector.dart';
import 'package:flutter_ecomerce_ui/data_layer/datasuorce/secure_storage_helper/secure_storage_helper.dart';
import 'package:flutter_ecomerce_ui/presentation/login_register/widgets/register_button.dart';
import 'package:flutter_ecomerce_ui/presentation/login_register/widgets/register_confirm_password.dart';
import 'package:flutter_ecomerce_ui/presentation/login_register/widgets/regiter_name_input.dart';

import 'package:formz/formz.dart';

import '../bloc/login_bloc.dart';
import '../widgets/login_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: RegisterPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocProvider(
              create: (_) => getIt.get<LoginCubit>(),
              child: const RegisterForm(),
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const NameInput(),
          const EmailInput(),
          const PasswordInput(),
          const RegisterConfirmPasswordInput(),
          const RegisterButton(),
          TextButton(
              onPressed: () async {
                await getIt.get<SecureStorageHelper>().deleteAll();
              },
              child: const Text("Delete Key"))
        ],
      ),
    );
  }
}





