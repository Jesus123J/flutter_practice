// main.dart
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyect_mobile/pages/Login_page.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

void main() {

  Get.lazyPut<Dio>(() {
    Dio dio = Dio();
    dio.options
      ..baseUrl = "http://192.168.56.1:9092"
      ..connectTimeout = Duration(milliseconds: 60000);

    dio.interceptors.add(TalkerDioLogger(settings: const TalkerDioLoggerSettings(),));
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );
    return dio;
  }, fenix: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Login App',
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/home', page: () => HomePage()),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            onPressed: () {
              Get.offNamed('/login');
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(child: Text("Bienvenido a la aplicación!")),
    );
  }
}
