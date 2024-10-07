

import 'package:create_web_application_cv/feature/cv/view/pages/dashboard_left.dart';
import 'package:create_web_application_cv/feature/cv/view/widgets/app_bar_personalitation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home:  Scaffold(
        backgroundColor: Colors.amber,
          appBar: AppBar(

        title: Text('AppBar con Botones a la Derecha'),
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SizedBox(
              width: 150, // Ancho del TextField
              child:  TextField(decoration: InputDecoration(
                hintText: 'Escribe tu mensaje aquí', // Mensaje que desaparece al escribir
                hintStyle: TextStyle(color: Colors.grey), // Color del texto del hint
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), // Esquinas redondeadas
                  borderSide: BorderSide(color: Colors.blue, width: 2.0), // Color y grosor del borde
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
                style: TextStyle(color: Colors.black), // Color del texto
              ),
            ),
          ),

          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('Botón de búsqueda presionado');
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              print('Botón de notificaciones presionado');
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              print('Botón de configuración presionado');
            },
          ),
        ],
      ),
        drawer: Drawer(

        ),
        body: Center(child:DashboardLeft(),)
      )

    );
  }
}