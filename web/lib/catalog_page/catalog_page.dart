import 'package:flutter/material.dart';
import 'package:flutter_application_main/catalog_page/VerticalListView.dart';


// Класс для вашей страницы каталога
class CatalogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          boxShadow: [
              BoxShadow(
               color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5), // Цвет тени
               spreadRadius: 5, // Размер тени
               blurRadius: 7, // Радиус размытия тени
               offset: Offset(0, 3), // Смещение тени
              ),
            ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Color.fromRGBO(1, 116, 121, 1)], // Цвета вашего градиента
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left:1.0, right: 1.0 ),
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                ),
                image: DecorationImage(
                image: AssetImage('assets/image/app_bar.jpg'),
                fit: BoxFit.cover,
                ), // Цвет для фона заголовка
               ),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Поиск...',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            // Действие при нажатии на кнопку поиска
                            print('Выполнить поиск...');
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: VerticalListView(),
            ),
          ],
        ),
      ),
    );
  }
}