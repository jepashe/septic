import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:septic/blocs/auth/auth_bloc.dart';
import 'package:septic/domain/api_client_old.dart';
import 'package:septic/core/navigation.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [AuthWidget()],
        ),
      ),
    );
  }
}

class AuthWidget extends StatelessWidget {
  const AuthWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _nameInput = TextEditingController();
    final _emailInput = TextEditingController();
    final _pinInput = TextEditingController();

    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AutenticationErrorState) {
          final snackBar = SnackBar(content: Text(state.error));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is AutenticationConfirmPinState) {
          Navigator.pushNamed(context, MainNavigationRouteNames.titleScreen);
        }
      },
      builder: (context, state) {
        if (state is AutenticationWaitingPinState) {
          return Column(
            children: [
              const Text('Введите код из письма'),
              TextField(
                controller: _pinInput,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: (() {
                      BlocProvider.of<AuthenticationBloc>(context)
                          .add(AutenticationNotEvent());
                    }),
                    child: const Text('Назад'),
                  ),
                  TextButton(
                    onPressed: (() {
                      BlocProvider.of<AuthenticationBloc>(context).add(
                          AuthenticationConfirmPinEvent(pin: _pinInput.text));
                    }),
                    child: const Text('Подтвердить'),
                  ),
                ],
              )
            ],
          );
        }
        if (state is AutenticationInProgressState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is AutenticationErrorState) {
          final snackBar = SnackBar(content: Text(state.error));
          WidgetsBinding.instance.addPostFrameCallback(
              (_) => ScaffoldMessenger.of(context).showSnackBar(snackBar));
        }
        return Column(children: [
          const SizedBox(height: 5),
          const SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              labelText: 'Имя пользователя',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            controller: _nameInput,
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              labelText: 'Электронная почта',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            controller: _emailInput,
          ),
          const SizedBox(height: 25),
          TextButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.grey)),
            onPressed: (() {
              context.read<AuthenticationBloc>().add(AuthenticationSignUpEvent(
                  email: _emailInput.text, name: _nameInput.text));
            }),
            child: const Text('Регистрация'),
          ),
          TextButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.grey)),
            onPressed: () {
              ApiClient()
                  .signUp(email: _emailInput.text, name: _nameInput.text);
            },
            child: const Text('Тест'),
          ),
        ]);
      },
    );
  }
}
