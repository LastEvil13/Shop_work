import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FlowerListView extends StatefulWidget {
  @override
  _FlowerListViewState createState() => _FlowerListViewState();
}

class MyItemFlower {
  final String text;
  final String imagePath;
  final String pageLink;

  MyItemFlower({required this.text, required this.imagePath, required this.pageLink});
}

class _FlowerListViewState extends State<FlowerListView> {
  // Список элементов
  List<MyItemFlower> items = [
    MyItemFlower(
      text: 'СБОРНЫЕ БУКЕТЫ',
      imagePath: 'assets/image/collect_bucket.jpg',
      pageLink: '/bouquets_page',
    ),
    MyItemFlower(
      text: 'МОНОБУКЕТЫ',
      imagePath: 'assets/image/mono_bucket.jpg',
      pageLink: '/mono_bouquets_page',
    ),
    MyItemFlower(
      text: 'КОМНАТНЫЕ РАСТЕНИЯ',
      imagePath: 'assets/image/house_flower.jpg',
      pageLink: '/house_flower_page',
    ), 
    MyItemFlower(
      text: 'ПОПУЛЯРНОЕ',
      imagePath: 'assets/image/popular_flower.jpg',
      pageLink: '/popular_flower_page',
    ),
    MyItemFlower(
      text: 'АКЦИИ',
      imagePath: 'assets/image/sale_flower.jpg',
      pageLink: '/promo_flower_page',
    ),
  ];

  List<MyItemFlower> favoriteItemsArticle = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, items[index].pageLink);
          },
          child: Container(
            width: 300,
            height: 160,
            margin: EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20, top: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5), // Цвет тени
                        spreadRadius: 5, // Размер тени
                        blurRadius: 7, // Радиус размытия тени
                        offset: Offset(0, 3), // Смещение тени
                      ),
                    ],
                  ),
                  child: Image.asset(
                    items[index].imagePath,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Text(
                      items[index].text,
                      style: TextStyle(
                        fontFamily: 'Alegreya',
                        fontStyle: FontStyle.italic,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}