import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[buildHeader(context), buildMenuItems(context)],
        )),
      );
}

Widget buildHeader(BuildContext context) => Container(
      padding: const EdgeInsets.only(top: 60.0),
    );
Widget buildMenuItems(BuildContext context) => Column(
      children: [
        /*
        ListTile(
          leading: const Icon(
            Icons.home_outlined,
            color: mainText,
          ),
          title: const Text(
            'Домой',
            style: TextStyle(color: mainText),
          ),
          onTap: () => Navigator.pushNamed(context, '/title_screen'),
        ),
        ListTile(
          leading: const Icon(
            Icons.settings,
            color: mainText,
          ),
          title: const Text(
            'Настройки',
            style: TextStyle(color: mainText),
          ),
          onTap: () => Navigator.pushNamed(context, '/settings'),
        ),
        ListTile(
          leading: const Icon(
            Icons.person,
            color: mainText,
          ),
          title: const Text(
            'Профиль',
            style: TextStyle(color: mainText),
          ),
          onTap: () => Navigator.pushNamed(context, '/profile'),
        ),
        ListTile(
          leading: const Icon(
            Icons.phone,
            color: mainText,
          ),
          title: const Text(
            'Позвонить диспетчеру',
            style: TextStyle(color: mainText),
          ),
          onTap: () async =>
              await FlutterPhoneDirectCaller.callNumber('+79525299090'),
        ),
        ListTile(
            leading: const Icon(
              Icons.payment,
              color: mainText,
            ),
            title: const Text(
              'Оплатить',
              style: TextStyle(color: mainText),
            ),
            onTap: () async {
              final Uri url = Uri(
                  scheme: 'https',
                  host: 'xn--74-6kcaymg3bmueas.xn--p1ai',
                  path: '/oplata');
              const config = WebViewConfiguration(
                  enableJavaScript: true, enableDomStorage: true);
              if (await canLaunchUrl(url)) {
                await launchUrl(url, webViewConfiguration: config);
              }
            }),*/
      ],
    );
