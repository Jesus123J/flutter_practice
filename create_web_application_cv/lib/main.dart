import 'package:create_web_application_cv/feature/cv/view/pages/dashboard_left.dart';
import 'package:create_web_application_cv/feature/cv/view/widgets/app_bar_personalitation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            // backgroundColor: Colors.amber,
            appBar: AppBar(
              title: const Row(
                children: [
                  Icon(Icons.emoji_people_rounded),
                  Text("iDevExpert")
                ],
              ),
              backgroundColor: Colors.transparent,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.facebook),
                  onPressed: () {
                    print('Botón de búsqueda presionado');
                  },
                )
              ],
            ),
            body: Center(
              child: DashboardLeft(),
            )));
  }
}
