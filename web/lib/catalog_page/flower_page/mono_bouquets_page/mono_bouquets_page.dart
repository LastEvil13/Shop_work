import 'package:flutter/material.dart';
//import 'package:flutter_application_main/catalog_page/flower_page/flower_list_view.dart';
import 'package:flutter_application_main/catalog_page/flower_page/flower_page.dart';
import 'package:flutter_application_main/catalog_page/flower_page/mono_bouquets_page/mono_list_flower.dart';
//import 'package:flutter_application_main/catalog_page/bouquets_page/bouquets_list_view.dart';


class MonoBouquetsPage extends StatelessWidget {
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
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Color.fromRGBO(239, 214, 248, 1),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 1.0, right: 1.0),
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(239, 214, 248, 1), width: 2.0),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/image/mono_bucket.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FlowerPage()),
                      );
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  Text(
                    'МОНОБУКЕТЫ',
                    style: TextStyle(
                      fontFamily: 'Alegreya',
                      fontStyle: FontStyle.italic,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
             child: MyApp())
          ],
        ),
      ),
    );
  }
}