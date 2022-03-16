import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecomerce_ui/common/injector/injector.dart';

import 'package:flutter_ecomerce_ui/presentation/app/app_bloc_observer.dart';
import 'package:flutter_ecomerce_ui/presentation/app/views/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  BlocOverrides.runZoned(() async {
    runApp(const App());
  }, blocObserver: AppBlocObserver());

}
