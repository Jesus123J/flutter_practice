import 'package:flutter/material.dart';

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _dashboardPage();

}

class _dashboardPage extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          backgroundColor: Colors.brown,
       ),
    );
  }
}

void main() {
  runApp(MyApp());
}