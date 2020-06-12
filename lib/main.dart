import 'package:babynames/home/HomePageBody.dart';
import 'package:babynames/models/Nomi.dart';
import 'package:babynames/setting/setting.dart';
import 'package:flutter/material.dart';
import 'package:babynames/home/HomePage.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(ChangeNotifierProvider(
    //La classe dove ci sono tutti i nomi
    create: (context) => Nomi(),

    //La finestra della applicazione
    child: new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Baby Names",
      color: Colors.black,
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(body: HomePageBody()),
        '/home/setting': (contex) => HomePage(
              body: Setting(),
            ),
      },
    ),
  ));
}
