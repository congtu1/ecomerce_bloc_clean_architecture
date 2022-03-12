import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecomerce_ui/common/injector/injector.dart';
import 'package:flutter_ecomerce_ui/common/navigator_service/navigator_service.dart';
import 'package:flutter_ecomerce_ui/data_layer/repository/auth/auth_repo_imlp.dart';
import 'package:flutter_ecomerce_ui/data_layer/repository/auth/authentication_respository.dart';
import 'package:flutter_ecomerce_ui/presentation/app/app_bloc_observer.dart';
import 'package:flutter_ecomerce_ui/presentation/app/views/app.dart';
import 'package:flutter_ecomerce_ui/presentation/authentication/views/authentication_register_page.dart';

 void main() async {
     WidgetsFlutterBinding.ensureInitialized();
      await setup();
     BlocOverrides.runZoned(() async {
         runApp(const App());
       },
         blocObserver: AppBlocObserver()
       );

   // await setup();
   // return BlocOverrides.runZoned(() async {
   //   runApp(const App());
   // },
   //   blocObserver: AppBlocObserver()
   // );

}


