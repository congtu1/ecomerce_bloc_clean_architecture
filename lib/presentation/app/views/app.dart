import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_ui/common/injector/injector.dart';
import 'package:flutter_ecomerce_ui/common/navigator_service/navigator_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecomerce_ui/presentation/app/bloc/app_bloc.dart';
import 'package:flutter_ecomerce_ui/presentation/app/bloc/app_state.dart';
import 'package:flutter_ecomerce_ui/presentation/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_ecomerce_ui/presentation/cart/view/cart_page.dart';
import 'package:flutter_ecomerce_ui/presentation/home/view/home_page.dart';
import 'package:flutter_ecomerce_ui/presentation/login_register/views/register_page.dart';
import 'package:flutter_ecomerce_ui/presentation/product_detail/views/productdetail_page.dart';
import 'package:flutter_ecomerce_ui/presentation/splash/splash_page.dart';

import '../../login_register/views/login_page.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
            create: (context) => getIt.get<AuthenticationBloc>()),
        BlocProvider(create: (context) => getIt.get<AppBloc>()),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      home: FlowBuilder<AppState>(
        state: context.select((AppBloc bloc) => bloc.state),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}

List<Page> onGenerateAppViewPages(AppState state, List<Page<dynamic>> pages) {
  List<Page> pages = [];
  switch (state.route.name) {
    case "splash":
      return pages = [SplashPage.page()];
    case "home":
      return pages = [HomePage.page()];
    case "login":
      return pages = [LoginPage.page()];
    case "register":
      return pages = [RegisterPage.page()];
    case "initial":
      return pages = [SplashPage.page()];
    case "productDetail":
      return pages = [ProductDetailPage.page()];
    case "cart":
      return pages = [CartPage.page()];
  }
  return pages;
}
