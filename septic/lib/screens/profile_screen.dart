/*
import 'package:septic/screen/constants.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/headers_widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _giveVerse = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: mainText),
        backgroundColor: Colors.white,
        title: const Text(
          'Septic',
          style: TextStyle(color: mainText),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.exit_to_app,
              color: mainText,
            ),
          ),
        ],
      ),
      //drawer: const NavigationDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                'Профиль',
                style: TextStyle(
                  color: mainText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Имя владельца',
                style: TextStyle(
                  color: mainText,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainText, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Номер телефона',
                style: TextStyle(
                  color: mainText,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainText, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Страна',
                style: TextStyle(
                  color: mainText,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainText, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Город',
                style: TextStyle(
                  color: mainText,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainText, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Улица',
                style: TextStyle(
                  color: mainText,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainText, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Дом',
                style: TextStyle(
                  color: mainText,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainText, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const HeadersWidgets(
                  headerOne: 'Показать контактные данные сервисной службе',
                  headerTwo: 'Сервисная служба сама может позвонить вам'),
              Switch(
                activeColor: Colors.green,
                value: _giveVerse,
                onChanged: (bool newValue) {
                  setState(() {
                    _giveVerse = newValue;
                  });
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Сохранить',
                  style: TextStyle(
                    color: mainText,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor: MaterialStateProperty.all(mainText),
                    side: MaterialStateProperty.all(
                      const BorderSide(
                        width: 2.0,
                        color: mainText,
                      ),
                    ),
                    minimumSize:
                        MaterialStateProperty.all(const Size(2000, 50))),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
*/