import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:septic/blocs/septic_bloc/septic_bloc.dart';
import 'package:septic/custom_widgets/septic_paint.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height * 0.05;
    return BlocBuilder<SepticBloc, SepticState>(builder: (context, state) {
      if (state is SepticNotState) {
        return Scaffold(
          body: ElevatedButton(
              onPressed: () {}, child: const Text('Добавить септик')),
        );
      }
      return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: const Text(
            'Septic',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(children: [
              const SizedBox(height: 10),
              const SepticPaint(
                firstAlarmLevel: 90,
                secondAlarmLevel: 80,
                septicLevel: 60,
              ),
            ]),
          ),
        ),
      );
    });
  }
}
