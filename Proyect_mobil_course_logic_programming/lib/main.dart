import 'package:flutter/material.dart';

void main(){
   runApp(MyApp());
}

class MyApp extends StatelessWidget {
   @override
  Widget build(BuildContext context) {

      return Scaffold(
           body: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                 color: Colors.amber
              ),
           ),
      );
  }
}