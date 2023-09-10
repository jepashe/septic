import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:septic/blocs/load_app/load_bloc.dart';
import 'package:septic/core/navigation.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    context.read<LoadingAppBloc>().add(LoadingAppStartEvent());
    return BlocConsumer<LoadingAppBloc, LoadingAppState>(
      listener: (context, state) {
        if (state is LoadingAppWithoutUsersState) {
          Navigator.pushNamed(context, MainNavigationRouteNames.signup);
        }
        if (state is LoadingAppWhithCurrentUserState) {
          if (state.user.confirmed == 0) {
            Future.delayed(
                const Duration(seconds: 2),
                () => Navigator.pushNamed(
                    context, MainNavigationRouteNames.signup,
                    arguments: state.user));
          } else {
            
          }
        }
        if (state is LoadingAppErrorState) {
          const snackBar = SnackBar(content: Text('state.error'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        if (state is LoadingAppWithUsersState) {
          return Scaffold(
            body: Center(
              child: DropdownButton<dynamic>(
                items: state.usersItems,
                onChanged: (value) {
                  context
                      .read<LoadingAppBloc>()
                      .add(LoadingAppWhithCurrentUser(user: value));
                },
                hint: const Text(
                  'Выберите пользователя',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
            ),
          );
        }
        if (state is LoadingAppWhithCurrentUserState) {
          final userName = state.user.name;
          return Scaffold(
            body: Center(
              child: Text(
                '$userName добро пожаловать',
                style: const TextStyle(color: Colors.blueAccent),
              ),
            ),
          );
        }
        return const Scaffold(
          backgroundColor: Colors.blueAccent,
          body: Center(
            child: Text(
              'Septic',
              style: TextStyle(
                  color: Colors.white30,
                  fontSize: 50,
                  fontWeight: FontWeight.w300),
            ),
          ),
        );
      },
    );
  }
}
