import 'package:flutter/material.dart';
import 'package:flutter_application_main/buy_page/buy_list.dart';
//import 'package:flutter_application_main/catalog_page/VerticalListView.dart';


// Класс для вашей страницы каталога
class BuyPage extends StatelessWidget {
  final Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Color.fromRGBO(239, 221, 221, 1)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 1.0, right: 1.0),
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/image/one_button.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.shopping_basket,
                    size: 30,
                    color: Colors.black,
                  ),
                  Text(
                    'КОРЗИНА',
                    style: TextStyle(
                      fontFamily: 'Alegreya',
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CartPage(cart: cart),
            ),
          ],
        ),
      ),
    );
  }
}