import 'package:flutter/material.dart';
import 'package:proyect_mobil_course_logic_programming/pages/dashboard/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductPage(),
    );
  }
}
