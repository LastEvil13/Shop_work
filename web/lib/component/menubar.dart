import 'package:flutter/material.dart';
import 'package:flutter_application_main/catalog_page/catalog_page.dart';
import 'package:flutter_application_main/buy_page/buy_page.dart';
//import 'package:flutter_application_main/main_page/m_page.dart';
import 'package:flutter_application_main/profil_page/profil_page.dart';



class MenuApp extends StatefulWidget {
  @override
  _MenuAppState createState() => _MenuAppState();
}

class _MenuAppState extends State<MenuApp> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    //MPage(),
    CatalogPage(),
    BuyPage(),
    ProfilPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.8),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        items: const <BottomNavigationBarItem>[
          /*BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),*/
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Catalog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Buy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 0, 0, 0),
        onTap: _onItemTapped,
      ),
    );
  }
}

