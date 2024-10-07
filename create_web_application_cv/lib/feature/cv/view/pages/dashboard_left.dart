import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DashboardLeft extends StatelessWidget {
  final List<String> imgList = [
    'https://www.pexels.com/es-es/foto/sereno-arroyo-forestal-y-exuberante-paisaje-verde-28795100',
    'https://www.pexels.com/es-es/foto/sereno-arroyo-forestal-y-exuberante-paisaje-verde-28795100',
    'https://images.unsplash.com/photo-1726092707889-c4ef049d22df?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.98,
      height: MediaQuery.of(context).size.height * 0.98,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      ),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(

            expandedHeight: 200.0,  // Altura del AppBar cuando está expandido
            pinned: true,  // Hace que el AppBar se quede visible al hacer scroll
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Mi AppBar Personalizado'),
              background: Image.network(
                'https://via.placeholder.com/350x150', // Imagen de fondo al expandir
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    'Item $index',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
              childCount: 10,  // Número de elementos en la lista
            ),
          ),
          SliverToBoxAdapter(  // Se usa para adaptar widgets normales en un CustomScrollView
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Center(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 400.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    autoPlayInterval: Duration(seconds: 3),
                  ),
                  items: imgList.map((item) => Container(
                    child: Center(
                      child: Image.network(
                        item,
                        fit: BoxFit.cover,
                        width: 1000,
                      ),
                    ),
                  )).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
