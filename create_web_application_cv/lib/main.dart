import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _MyComponent()
    );
  }
}

class _MyComponent extends StatelessWidget {
  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Título de Alerta"),
          content: Text("Este es un mensaje de alerta."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: Text("Cerrar"),
            ),
            TextButton(
              onPressed: () {
                // Acción adicional
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: Text("Aceptar"),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
            child: Text("Hi , welcome to CV"),
          )),
      body: Column(
        children: <Widget>[
          Flexible(
            child: Container(
              color: Colors.white,
              child: Center(
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(255, 255, 255, 40),
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(20))),
                            child: Column(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.menu),
                                  onPressed: () {
                                    print('Hola');
                                    _showAlertDialog(context);
                                  },
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text("Contenido del Contenedor 1"),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Container(
                        width: 5,
                      ),
                      Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(20))),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}