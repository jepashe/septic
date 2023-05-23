/*
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
  final controllerLevel = TextEditingController();
  final controllerLevel2 = TextEditingController();
  late Future<Septic?> septicInfo;
  int? fromHour;
  int? fromMinutes;
  int? toHour;
  int? toMinutes;

  BorderRadiusGeometry radius = const BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );

  void logOut() async {
    //SessionDataProvider().setIds(null);
    await Hive.box('settings').delete('lds');
  }

  Future init() async {
    final firstlevel = await Hive.box('settings').get('firstlevel') ?? '80';
    final secondlevel = await Hive.box('settings').get('secondlevel') ?? '70';
    setState(() {
      this.controllerLevel.text = firstlevel;
      this.controllerLevel2.text = secondlevel;
    });
  }
  /*
  Future<Septic?> getInfo() async {
    return _client.getInfo();
  }

  void sendSettings() async {
    return _client.sendSettingsforPush();
  }

  int howMinutsBeginDay(int hour, int minuts) {
    return hour * 12 + minuts;
  }
  
  @override
  void initState() {
    init();
    septicInfo = getInfo();
    Timer.periodic(
        const Duration(seconds: 10),
        ((timer) => setState(() {
              septicInfo = getInfo();
            })));
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height * 0.05;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: mainText),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          'Septic',
          style: TextStyle(color: mainText),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: logOut,
            icon: const Icon(
              Icons.exit_to_app,
              color: mainText,
            ),
          ),
        ],
      ),
      drawer: const NavigationDrawer(),
      body: SlidingUpPanel(
        borderRadius: radius,
        minHeight: size,
        maxHeight: MediaQuery.of(context).size.height * 0.3,
        collapsed: Container(
          decoration:
              BoxDecoration(color: Colors.blueGrey, borderRadius: radius),
          child: Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.settings,
                    color: mainText,
                  ),
                  Text(
                    'Настройки',
                    style: TextStyle(color: mainText),
                  ),
                ]),
          ),
        ),
        panel: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.settings,
                        color: mainText,
                      ),
                      Text(
                        'Настройки',
                        style: TextStyle(color: mainText),
                      ),
                    ]),
                const SizedBox(height: 20),
                const Text(
                  'Второй критический уровень, %',
                  style: TextStyle(color: Colors.red),
                ),
                TextField(
                  controller: controllerLevel,
                  onSubmitted: (_) async {
                    await Hive.box('settings')
                        .put('firstlevel', controllerLevel.text);
                    setState(() {});
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  'Первый критический уровень, %',
                  style: TextStyle(
                    color: Color.fromARGB(255, 225, 244, 54),
                  ),
                ),
                TextField(
                  controller: controllerLevel2,
                  onSubmitted: (_) async {
                    await Hive.box('settings')
                        .put('secondlevel', controllerLevel2.text);
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                FutureBuilder<Septic?>(
                  future: septicInfo,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              'Данные на ${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}',
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 10),
                            const SepticPaint(
                              firstAlarmLevel: 90,
                              secondAlarmLevel: 80,
                              septicLevel: 60,
                            ),
                          ]);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/