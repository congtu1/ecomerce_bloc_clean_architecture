import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_ui/common/navigator_service/navigator_service.dart';
import 'package:flutter_ecomerce_ui/data_layer/datasuorce/remote/auth/auth_provider.dart';
import 'package:flutter_ecomerce_ui/data_layer/repository/auth/auth_repo_imlp.dart';
import 'package:flutter_ecomerce_ui/data_layer/repository/auth/authentication_respository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecomerce_ui/main.dart';
import 'package:flutter_ecomerce_ui/presentation/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_ecomerce_ui/presentation/authentication/bloc/authentication_states.dart';
import 'package:flutter_ecomerce_ui/presentation/home/view/home_page.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_ecomerce_ui/presentation/login/views/authentication_signin_page.dart';
import 'package:flutter_ecomerce_ui/presentation/splash/splash_page.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthRepoImpl>(create: (context) => AuthRepoImpl())
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AuthenticationBloc>(
                create: (context) => AuthenticationBloc(
                    authenticationRepository:
                        RepositoryProvider.of<AuthRepoImpl>(context)))
          ],
          child: AppView(),
        ));
    // return RepositoryProvider.value(
    //   value: _authenticationRepository,
    //   child: BlocProvider(
    //     create: (_) => AuthenticationBloc(authenticationRepository: _authenticationRepository),
    //     child: const AppView(),
    //   ),
    // );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      home: FlowBuilder<AuthenticationStatus>(
        state: context.select((AuthenticationBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}

List<Page> onGenerateAppViewPages(
    AuthenticationStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AuthenticationStatus.unknown:
      return [SplashPage.page()];
    case AuthenticationStatus.authenticated:
      return [HomePage.page()];
    case AuthenticationStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
