import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:septic/blocs/septic_bloc/septic_bloc.dart';
import 'package:septic/custom_widgets/septic_paint.dart';
import 'package:septic/domain/septic_repository.dart';
import 'package:septic/entity/user.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments;

    final currentUser = user as User;

    return BlocProvider<SepticBloc>(
      create: (context) =>
          SepticBloc(septicRepository: SepticRepository(), user: currentUser),
      child: const SepticScreen(),
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
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              BlocProvider.of<SepticBloc>(context)
                                  .add(SepticAddInfoAboutNewDeviceEvent());
                            },
                            child: const Text('Добавить септик')),
                      ],
                    ),
                  );
                }
                if (state is SepticAddInfoAboutNewDeviceState) {
                  return const SepticAddInfoAboutNewDeviceWidget();
                }
                if (state is SepticListDeviceState) {
                  return ListSepticsNew();
                }
                return const Text('gdfgd');
              },
              listener: (context, state) {
                if (state is SepticAddNewDeviceSucsessState) {
                  BlocProvider.of<SepticBloc>(context)
                      .add(SepticCheckUserDeviceEvent());
                }
              },
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
                  volume: _volume.text,
                  radius: _radius.text,
                  height: _height.text,
                  shift: _shift.text,
                  threshold: _threshold.text,
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

class ListSeptics extends StatelessWidget {
  const ListSeptics({Key? key, required this.septics}) : super(key: key);
  final List<dynamic> septics;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: septics.length,
      itemBuilder: ((context, index) {
        final data = septics[index]['last_data'];
        if (data == null) {
          return Column(
            children: [
              Text(septics[index]["name"]),
              const SepticPaint(
                firstAlarmLevel: 0,
                secondAlarmLevel: 0,
                septicLevel: 0,
              ),
            ],
          );
        } else {
          return Column(
            children: [
              Text(septics[index]["name"]),
              SepticPaint(
                firstAlarmLevel: 0,
                secondAlarmLevel: 0,
                septicLevel: data['percent'] as double,
              ),
            ],
          );
        }
      }),
    );
  }
}

class ListSepticsNew extends StatefulWidget {
  @override
  _ListSepticsNewState createState() => _ListSepticsNewState();
}

class _ListSepticsNewState extends State<ListSepticsNew> {
  final controller = PageController();

  final int count = 4;

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _heidth = MediaQuery.of(context).size.height;

    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const SizedBox(height: 16),
          SizedBox(
            height: 240,
            child: PageView.builder(
              controller: controller,
              itemBuilder: (_, index) {
                return Container(
                  height: 200,
                  color: Colors.amber,
                  child: Text('$index'),
                );
              },
              itemCount: count,
            ),
          ),
          const SizedBox(height: 16),
          SmoothPageIndicator(
            controller: controller,
            count: count,
            effect: const WormEffect(
              dotHeight: 16,
              dotWidth: 16,
              type: WormType.thinUnderground,
            ),
          ),
        ]);
  }
}
