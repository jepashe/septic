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
    final _nameInput = TextEditingController(text: 'Pavel1');
    final _emailInput = TextEditingController(text: 'subochev.pavel@test.com');
    final _passwordInput = TextEditingController(text: '12345678');
    final _codeInput = TextEditingController(text: '12345678');

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
              const SizedBox(height: 25),
              TextField(
                controller: _codeInput,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  TextButton(
                    child: const Text("Назад", style: TextStyle(fontSize: 14)),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(15)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    side:
                                        const BorderSide(color: Colors.blue)))),
                    onPressed: (() {
                      BlocProvider.of<SignUpBloc>(context).add(
                          SignUpConfirmCodePinEvent(code: _codeInput.text));
                    }),
                  ),
                  const SizedBox(width: 25),
                  TextButton(
                    child: const Text("Подтвердить",
                        style: TextStyle(fontSize: 14)),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(15)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    side:
                                        const BorderSide(color: Colors.blue)))),
                    onPressed: (() {
                      BlocProvider.of<SignUpBloc>(context).add(
                          SignUpConfirmCodePinEvent(code: _codeInput.text));
                    }),
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
          const Icon(
            Icons.account_circle,
            color: Colors.blue,
            size: 200,
          ),
          const Text(
            'Регистрация нового пользователя',
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 25),
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
          const SizedBox(height: 25),
          TextButton(
              child: const Text("Зарегистрироватся",
                  style: TextStyle(fontSize: 14)),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.all(15)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(color: Colors.blue)))),
              onPressed: (() {
                context.read<SignUpBloc>().add(SignUpNewUserEvent(
                    email: _emailInput.text,
                    name: _nameInput.text,
                    password: _passwordInput.text));
              })),
        ]);
      },
    );
  }
}
