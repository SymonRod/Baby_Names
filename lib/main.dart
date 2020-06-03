import 'package:cercanomi/home/HomePageBody.dart';
import 'package:cercanomi/models/Nomi.dart';
import 'package:cercanomi/setting/setting.dart';
import 'package:flutter/material.dart';
import 'package:cercanomi/home/HomePage.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(
    ChangeNotifierProvider(
      
      //La classe dove ci sono tutti i nomi
      create: (context) => Nomi(),

      //La finestra della applicazione
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Cerca Nomi",
        color: Colors.black,
        initialRoute: '/home',
        routes: {
          '/home':(context) => HomePage(
            body: HomePageBody()
          ),
          '/home/setting': (contex) => HomePage(
            body: Setting(),
          ),
        },
      ),
    )
  );
}
