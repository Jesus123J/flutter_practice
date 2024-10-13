import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DashboardLeft extends StatelessWidget {
  final List<String> imgList = [
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
          SliverToBoxAdapter(
             child: Padding(
                 padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
               child: Container(
                   height: 400,
                   color: Colors.white,
                  child: Row(
                     children: [
                        Container(

                        ),
                        Container(

                        )
                     ],
                  ),
               ),
             ),
          )
          ],
      ),
    );
  }
}
