import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:septic/blocs/sign_in/sign_in_bloc.dart';
import 'package:septic/core/navigation.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _emailInput = TextEditingController();
    final _passwordInput = TextEditingController();
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccessfullState) {
          Navigator.pushNamed(context, MainNavigationRouteNames.titleScreen);
        }
      },
      builder: (context, state) {return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Вход',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    side:
                                        const BorderSide(color: Colors.blue)))),
                    onPressed: (() {
                      context.read<SignInBloc>().add(SignInWhithEmailEvent(
                          email: _emailInput.text,
                          password: _passwordInput.text));
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    side:
                                        const BorderSide(color: Colors.blue)))),
                    onPressed: (() {
                      Navigator.pushNamed(
                          context, MainNavigationRouteNames.signup);
                    }),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    child: const Text("Забыл пароль",
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
                    onPressed: (() {}),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );}
    ); 
  }
}
