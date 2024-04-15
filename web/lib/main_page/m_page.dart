import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_main/main_page/HorizontalListView.dart';
//import 'package:flutter_application_main/main_page/HorizontalListView.dart';



class MPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 231, 244, 1),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 1.0, right: 1.0 ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
            border: Border.all(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50.0),
              bottomRight: Radius.circular(50.0),
            ),
            image: DecorationImage(
              image: AssetImage('assets/image/purple.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          height: 300,
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
                        print('Выполнить поиск...');
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: HorizontalListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

