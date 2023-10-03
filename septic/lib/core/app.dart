import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:septic/blocs/load_app/load_bloc.dart';
import 'package:septic/blocs/septic_bloc/septic_bloc.dart';
import 'package:septic/blocs/sign_in/sign_in_bloc.dart';
import 'package:septic/blocs/sign_up/sign_up_bloc.dart';

import 'package:septic/core/navigation.dart';
import 'package:septic/domain/auth_repository.dart';
import 'package:septic/domain/septic_repository.dart';
import 'package:septic/domain/store_repository.dart';
import 'package:septic/entity/user.dart';

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const MyApp({
    required this.store,
    Key? key,
  }) : super(key: key);

  final Box<User> store;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoadingAppBloc>(
              create: (context) => LoadingAppBloc(
                  storeRepository: StoreRepository(store: store))),
          BlocProvider<SignUpBloc>(
              create: (context) => SignUpBloc(
                  authenticationRepository: AuthenticationRepository(),
                  storeRepository: StoreRepository(store: store))),
          BlocProvider<SignInBloc>(
              create: (context) => SignInBloc(
                  authenticationRepository: AuthenticationRepository(),
                  storeRepository: StoreRepository(store: store))),
          BlocProvider<SepticBloc>(
              create: (context) => SepticBloc(
                  septicRepository: SepticRepository(),
                  storeRepository: StoreRepository(store: store))),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Septic',
          routes: mainNavigation.routes,
          initialRoute: MainNavigationRouteNames.splash,
          theme: ThemeData.light(),
        ));
  }
}
