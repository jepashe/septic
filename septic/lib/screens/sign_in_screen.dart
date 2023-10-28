import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:septic/blocs/sign_in/sign_in_bloc.dart';
import 'package:septic/core/navigation.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: BlocConsumer<SignInBloc, SignInState>(
                listener: (context, state) {
              if (state is SignInSuccessfullState) {
                Navigator.pushNamed(
                    context, MainNavigationRouteNames.titleScreen);
              }
            }, builder: (context, state) {
              if (state is SignInRemaindPasswordState) {
                return SignInRemaindPassword();
              }
              if (state is SignInWaitCodeResetPasswordState) {
                return SignInInputCodeResetPassword(email: state.email,);
              }
              if (state is SignInConfirmCodeState) {
                return SignInConfirmCode();
              }
              return SignInWhithEmail();
            }),
          ),
        ),
      ),
    );
  }
}

class SignInInputCodeResetPassword extends StatelessWidget {
  SignInInputCodeResetPassword({Key? key, required String email}) : _email = email, super(key: key);
  final _codeInput = TextEditingController();
  final _email;
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Код подтверждения',
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 25),
          const Text('Для отправки Вам нового пароля введите код подверждения'),
          const SizedBox(height: 25),
          TextField(
            decoration: InputDecoration(
              labelText: 'Код подтверждения',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            controller: _codeInput,
          ),
          const SizedBox(height: 25),
          TextButton(
            child: const Text("Подтвердить", style: TextStyle(fontSize: 14)),
            style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.all(15)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: Colors.blue)))),
            onPressed: (() {
              context.read<SignInBloc>().add(
                  SignInSendConfirmCodeEvent(email: _email, code: _codeInput.text));
            }),
          ),
        ],
      ),
    );
  }
}

class SignInConfirmCode extends StatelessWidget {
  final _emailInput = TextEditingController();
  SignInConfirmCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Подтверждение сброса пароля',
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 25),
          const Text('Введите код подверждения сброса пароля из email'),
          const SizedBox(height: 25),
          TextField(
            decoration: InputDecoration(
              labelText: 'Код подтверждения',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            controller: _emailInput,
          ),
          const SizedBox(height: 25),
          TextButton(
            child: const Text("Подтвердить", style: TextStyle(fontSize: 14)),
            style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.all(15)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: Colors.blue)))),
            onPressed: (() {
              context.read<SignInBloc>().add(
                  SignInSendForgetPasswordOnEmailEvent(
                      email: _emailInput.text));
            }),
          ),
        ],
      ),
    );
  }
}

class SignInRemaindPassword extends StatelessWidget {
  SignInRemaindPassword({Key? key}) : super(key: key);
  final _emailInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Восстановление пароля',
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 25),
        const Text(
            'Для восстановления пароля введите email указанный при регистрации'),
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
        TextButton(
          child: const Text("Продолжить", style: TextStyle(fontSize: 14)),
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(15)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(color: Colors.blue)))),
          onPressed: (() {
            context.read<SignInBloc>().add(
                SignInSendForgetPasswordOnEmailEvent(email: _emailInput.text));
          }),
        ),
      ],
    ));
  }
}

class SignInWhithEmail extends StatelessWidget {
  SignInWhithEmail({Key? key}) : super(key: key);

  final _emailInput = TextEditingController();
  final _passwordInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Вход',
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),
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
          Row(
            children: [
              TextButton(
                child: const Text("Войти", style: TextStyle(fontSize: 14)),
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
                  context.read<SignInBloc>().add(SignInWhithEmailEvent(
                      email: _emailInput.text, password: _passwordInput.text));
                }),
              ),
              const SizedBox(
                width: 10,
              ),
              TextButton(
                child: const Text("Назад", style: TextStyle(fontSize: 14)),
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
                  Navigator.pushNamed(context, MainNavigationRouteNames.signup);
                }),
              ),
              const SizedBox(
                width: 10,
              ),
              TextButton(
                child: const Text("Забыли пароль?",
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
                  context.read<SignInBloc>().add(SignInRemaindPasswordEvent());
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
