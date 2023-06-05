import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:septic/blocs/sign_up/signup_bloc.dart';
import 'package:septic/core/app.dart';
import 'package:septic/entity/user.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class PostHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  HttpOverrides.global = PostHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());

  final usersStore = await Hive.openBox<User>('usersStore');

  final fcmToken = await FirebaseMessaging.instance.getToken();
  /*
  if (fcmToken != null) {
    Hive.box('settings').put('fcmToken', fcmToken);
  }*/
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  Bloc.observer = MyBlocObserver();
  runApp(MyApp(store: usersStore));
}
