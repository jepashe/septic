import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:septic/blocs/auth/auth_bloc.dart';
import 'package:septic/blocs/load_app/load_bloc.dart';
import 'package:septic/core/navigation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    context.read<LoadingAppBloc>().add(LoadingAppStartEvent());
    return BlocListener<LoadingAppBloc, LoadingAppState>(
      listener: (context, state) {
        if (state is LoadingAppWithUsersState) {
          context
              .read<AuthenticationBloc>()
              .add(AuthenticationWaitingConfirmPinEvent());
        }
        if (state is LoadingAppWithoutUsersState) {
          context.read<AuthenticationBloc>().add(AutenticationNotEvent());
        }
        if (state is LoadingAppErrorState) {
          const snackBar = SnackBar(content: Text('state.error'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is LoadingAppSuccessState) {
          Navigator.pushNamed(context, MainNavigationRouteNames.auth);
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
