
/*
import 'package:flutter/material.dart';
import 'package:septic/custom_widgets/headers_widgets.dart';
import 'package:septic/custom_widgets/input_inline_widget.dart';
import 'package:septic/custom_widgets/input_widget.dart';
import 'package:septic/screen/constants.dart';
import 'package:septic/screen/navigation.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _giveVerse = false;

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
      drawer: const NavigationDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                'Настройки',
                style: TextStyle(
                  color: mainText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Название датчика',
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
                  headerOne: 'Рассточние от датчика уровня до дна',
                  headerTwo: 'Расстояние вводится в сантиметрах'),
              const TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainText, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const HeadersWidgets(
                  headerOne: 'Критический уровень воды (см)',
                  headerTwo: 'Расстояние от датчика до критической отметки'),
              const TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainText, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const HeadersWidgets(
                  headerOne: 'Критическая концентрация ила (%)',
                  headerTwo: 'По достижению значения придет PUSH'),
              const TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainText, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const HeadersWidgets(
                  headerOne: 'Критический уровень жира (%)',
                  headerTwo: 'По достижению значения придет PUSH'),
              const TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainText, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const HeadersWidgets(
                  headerOne: 'Критический уровень осадка (%)',
                  headerTwo: 'По достижению значения придет PUSH'),
              const TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainText, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const HeadersWidgets(
                  headerOne: 'Давление',
                  headerTwo: 'По достижению значения придет PUSH'),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Expanded(
                    child: InputWidget(data: 'Минимум'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: InputWidget(data: 'Номинал'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: InputWidget(data: 'Максимум'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const HeadersWidgets(
                  headerOne: 'Температура (С)',
                  headerTwo: 'По достижению значения придет PUSH'),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Expanded(
                    child: InputWidget(data: 'Минимум'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: InputWidget(data: 'Максимум'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Геоточка',
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
                  headerOne: 'Статистические данные с датчика',
                  headerTwo: 'Услуга платная, 20 руб. в месяц'),
              Switch(
                value: _giveVerse,
                onChanged: (bool newValue) {
                  setState(() {
                    _giveVerse = newValue;
                  });
                },
              ),
              const SizedBox(height: 10),
              const Text(
                'Уведомления',
                style: TextStyle(
                  color: mainText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "О состоянии ёмкости",
                style: TextStyle(
                  color: mainText,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SetNotfication(
                defaultValue: 'Переполнение',
                values: ['Переполнение', 'Опустошение'],
              ),
              const Text(
                "О достижении критического уровня воды",
                style: TextStyle(
                  color: mainText,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SetNotfication(
                defaultValue: '10 мин',
                values: ['OFF', '10 мин', '30 мин', '1 час', '2 часа'],
              ),
              const Text(
                "О загрезнении датчика уровня",
                style: TextStyle(
                  color: mainText,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SetNotfication(
                defaultValue: '10 мин',
                values: ['OFF', '10 мин', '30 мин', '1 час', '2 часа'],
              ),
              const Text(
                "О достижении критической концентрации ила",
                style: TextStyle(
                  color: mainText,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SetNotfication(
                defaultValue: '10 мин',
                values: ['OFF', '10 мин', '30 мин', '1 час', '2 часа'],
              ),
              SetNotfication2(),
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
}*/
