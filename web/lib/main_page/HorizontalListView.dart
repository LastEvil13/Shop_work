import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class MyItemArticle {
  final String imagePath;

  MyItemArticle({required this.imagePath});
}

class HorizontalListView extends StatefulWidget {
  @override
  _HorizontalListViewState createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  List<MyItemArticle> items = [
    MyItemArticle(
      imagePath: 'assets/image/collect_bucket.jpg',
    ),
    MyItemArticle(
      imagePath: 'assets/image/collect_bucket.jpg',
    ),
    MyItemArticle(
      imagePath: 'assets/image/collect_bucket.jpg',
    ),     
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          width: MediaQuery.of(context).size.width * 0.8, // Занимает всю ширину экрана
          margin: EdgeInsets.all(30.0),
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
            //color: Colors.black,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
               color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.3), // Цвет тени
               spreadRadius: 7, // Размер тени
               blurRadius: 9, // Радиус размытия тени
               offset: Offset(0, 3), // Смещение тени
              ),
            ],
          ),
          child: Image.asset(
            items[index].imagePath,
            fit: BoxFit.fitWidth,
          ),
        );
      },
    );
  }
}