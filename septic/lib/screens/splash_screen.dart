import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:septic/blocs/load_app/load_bloc.dart';
import 'package:septic/core/navigation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    context.read<LoadingAppBloc>().add(LoadingAppStartEvent());
    return BlocListener<LoadingAppBloc, LoadingAppState>(
      listener: (context, state) {
        if (state is LoadingAppWithoutUsersState) {
          Navigator.pushNamed(context, MainNavigationRouteNames.signup);
        }
        if (state is LoadingAppWithUsersState) {
          Navigator.pushNamed(context, MainNavigationRouteNames.signin);
        }
        if (state is LoadingAppErrorState) {
          const snackBar = SnackBar(content: Text('state.error'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: const Scaffold(
        body: Center(
          child: Text('Septic'),
        ),
      ),
    );
  }
}
