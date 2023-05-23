import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:septic/blocs/auth/auth_bloc.dart';
import 'package:septic/blocs/load_app/load_bloc.dart';
import 'package:septic/core/navigation.dart';
import 'package:septic/domain/auth_repository.dart';
import 'package:septic/domain/store_repository.dart';

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoadingAppBloc>(
              create: (context) =>
                  LoadingAppBloc(storeRepository: StoreRepository())),
          BlocProvider<AuthenticationBloc>(
              create: (context) => AuthenticationBloc(
                  authenticationRepository: AuthenticationRepository(),
                  storeRepository: StoreRepository()))
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
