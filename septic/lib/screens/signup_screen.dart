import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:septic/blocs/sign_up/signup_bloc.dart';
import 'package:septic/core/navigation.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [SignUpWidget()],
        ),
      ),
    );
  }
}

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _nameInput = TextEditingController();
    final _emailInput = TextEditingController();
    final _passwordInput = TextEditingController();
    final _codeInput = TextEditingController();

    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpErrorState) {
          final snackBar = SnackBar(content: Text(state.error));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

        if (state is SignUpSucsessState) {
          Navigator.pushNamed(context, MainNavigationRouteNames.titleScreen);
        }
      },
      builder: (context, state) {
        if (state is SignUpEnteringConfirmCodeEmailState) {
          return Column(
            children: [
              const Text('Введите код из письма'),
              TextField(
                controller: _codeInput,
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
                      BlocProvider.of<SignUpBloc>(context)
                          .add(SignUpEnteringFieldEvent());
                    }),
                    child: const Text('Назад'),
                  ),
                  TextButton(
                    onPressed: (() {
                      BlocProvider.of<SignUpBloc>(context).add(
                          SignUpConfirmCodePinEvent(code: _codeInput.text));
                    }),
                    child: const Text('Подтвердить'),
                  ),
                ],
              )
            ],
          );
        }
        if (state is SignUpInProgressState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SignUpErrorState) {
          final snackBar = SnackBar(content: Text(state.error));
          WidgetsBinding.instance.addPostFrameCallback(
              (_) => ScaffoldMessenger.of(context).showSnackBar(snackBar));
        }
        return Column(children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Имя пользователя',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            controller: _nameInput,
          ),
          const SizedBox(height: 25),
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
          TextField(
            decoration: InputDecoration(
              labelText: 'Пароль',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            controller: _passwordInput,
          ),
          TextButton(
            onPressed: (() {
              context.read<SignUpBloc>().add(SignUpNewUserEvent(
                  email: _emailInput.text,
                  name: _nameInput.text,
                  password: _passwordInput.text));
            }),
            child: const Text('Зарегистрироватся'),
          ),
        ]);
      },
    );
  }
}
