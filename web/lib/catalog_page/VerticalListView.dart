import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VerticalListView extends StatefulWidget {
  @override
  _VerticalListViewState createState() => _VerticalListViewState();
}

class MyItem {
  final String text;
  final String imagePath;
  final String pageLink;

  MyItem({required this.text, required this.imagePath, required this.pageLink});
}

class _VerticalListViewState extends State<VerticalListView> {
  // Список элементов
  List<MyItem> items = [
    MyItem(
      text: 'ЦВЕТЫ',
      imagePath: 'assets/image/collect_bucket.jpg',
      pageLink: '/flower_page',
    ),
    MyItem(
      text: 'СЛАДОСТИ',
      imagePath: 'assets/image/sweat_catalog.jpg',
      pageLink: '/sweat_page',
    ),
    MyItem(
      text: 'ШАРЫ',
      imagePath: 'assets/image/card_gift.jpg',
      pageLink: '/ball_postcard_page',
    ), 
    MyItem(
      text: 'ПОДАРОЧНЫЕ БОКСЫ',
      imagePath: 'assets/image/gift_box.jpg',
      pageLink: '/gift_box_page',
    ),
  ];

  List<MyItem> favoriteItemsArticle = [];

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
                        color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3), // Цвет тени
                        spreadRadius: 7, // Размер тени
                        blurRadius: 9, // Радиус размытия тени
                        offset: Offset(0, 5), // Смещение тени
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