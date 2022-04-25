import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_ui/common/injector/injector.dart';
import 'package:flutter_ecomerce_ui/presentation/app/bloc/app_bloc.dart';
import 'package:flutter_ecomerce_ui/presentation/app/bloc/app_event.dart';
import 'package:flutter_ecomerce_ui/presentation/app/bloc/app_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: SplashPage());

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      timer.cancel();
      return getIt.get<AppBloc>().add(AppRoutePush(AppRoute.home));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Splash page"),
        ),
      ),
    );
  }
}
