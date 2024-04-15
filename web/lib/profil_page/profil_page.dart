import 'package:flutter/material.dart';



class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('это профиль пользователя приложения'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
                alignment: Alignment.bottomCenter,
                height: 48.0,
              ),
          ]
      ),
    );
  }
}