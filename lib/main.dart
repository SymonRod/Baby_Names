import 'package:cercanomi/models/Nomi.dart';
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
        home: HomePage(),
        color: Colors.black,
      ),
    )
  );
}
