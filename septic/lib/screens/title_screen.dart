import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:septic/custom_widgets/septic_paint.dart';
import 'package:septic/entity/septic.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class TitleScreen extends StatefulWidget {
  const TitleScreen({Key? key}) : super(key: key);

  @override
  TitleScreenState createState() => TitleScreenState();
}

class TitleScreenState extends State<TitleScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height * 0.05;
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
  }
}
