import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:septic/blocs/septic_bloc/septic_bloc.dart';
import 'package:septic/domain/septic_repository.dart';
import 'package:septic/entity/user.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments;

    final currentUser = user as User;

    return BlocProvider<SepticBloc>(
      create: (context) =>
          SepticBloc(septicRepository: SepticRepository(), user: currentUser),
      child: SepticScreen(),
    );
  }
}

class SepticScreen extends StatelessWidget {
  const SepticScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SepticBloc>(context).add(SepticCheckUserDeviceEvent());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: BlocConsumer<SepticBloc, SepticState>(
              builder: (context, state) {
                if (state is SepticNotState) {
                  return TextButton(
                      onPressed: () {
                        BlocProvider.of<SepticBloc>(context)
                            .add(SepticAddInfoAboutNewDeviceEvent());
                      },
                      child: const Text('Добавить септик'));
                }
                if (state is SepticAddInfoAboutNewDeviceState) {
                  return const SepticAddInfoAboutNewDeviceWidget();
                }
                return const Text('gdfgd');
              },
              listener: (context, state) {},
            ),
          ),
        ),
      ),
    );
  }
}

class SepticAddInfoAboutNewDeviceWidget extends StatelessWidget {
  const SepticAddInfoAboutNewDeviceWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _number = TextEditingController();
    final _address = TextEditingController();
    final _phone = TextEditingController();
    final _contact = TextEditingController();
    final _volume = TextEditingController();
    final _radius = TextEditingController();
    final _height = TextEditingController();
    final _shift = TextEditingController();
    final _threshold = TextEditingController();

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Добавьте информацию о вашем септике'),
          const SizedBox(
            height: 25,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Идентификатор устройства',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            controller: _number,
          ),
          const SizedBox(
            height: 25,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Адрес установки устройства',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            controller: _address,
          ),
          const SizedBox(
            height: 25,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Телефон контакта',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            controller: _phone,
          ),
          const SizedBox(
            height: 25,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Имя контакта',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            controller: _contact,
          ),
          const SizedBox(
            height: 25,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Объем резервуара',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            controller: _volume,
          ),
          const SizedBox(
            height: 25,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Диаметр резервуара',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            controller: _radius,
          ),
          const SizedBox(
            height: 25,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Высота резервуара',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            controller: _height,
          ),
          const SizedBox(
            height: 25,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Высота установки устройства над максимальным уровнем',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            controller: _shift,
          ),
          const SizedBox(
            height: 25,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Порог уведомления',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            controller: _threshold,
          ),
          const SizedBox(
            height: 25,
          ),
          TextButton(
              child: const Text("Создать новый септик",
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
                BlocProvider.of<SepticBloc>(context)
                    .add(SepticSendInfoAboutNewDeviceEvent(
                  number: _number.text,
                  address: _address.text,
                  phone: _phone.text,
                  contact: _contact.text,
                  volume: (_volume.text) as double,
                  radius: (_radius.text) as double,
                  height: (_height.text) as double,
                  shift: (_shift.text) as double,
                  threshold: (_threshold.text) as double,
                ));
              })),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}


/*
return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(children: const [
            SizedBox(height: 10),
            SepticPaint(
              firstAlarmLevel: 90,
              secondAlarmLevel: 80,
              septicLevel: 70,
            ),
          ]),
        ),
      );
*/