import 'package:flutter/material.dart';

class UIApp {
  static const _mainText = Colors.black;
  static final AppBar appBarUI = AppBar(
    iconTheme: const IconThemeData(color: _mainText),
    backgroundColor: Colors.white,
    title: const Text(
      'Septic',
      style: TextStyle(color: _mainText),
    ),
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.exit_to_app,
          color: _mainText,
        ),
      ),
    ],
  );

  static final textFieldDecoration = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  );
}
