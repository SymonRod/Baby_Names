import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cercanomi/models/Nome.dart';

import 'httpclient.dart' as httpclient;


Future<List<Nome>> fetchNomi(String nome) async {
    String url = 'https://rodopo.000webhostapp.com/api/nomi.php?nome=$nome&lingua=IT,&type=json';

    var data = await httpclient.fetchResource(
      url: url,
      );
    
    var jsonData = jsonDecode(data) as List;

    var tagObjs = jsonData.map((tagJson) => Nome.fromJson(tagJson)).toList();
    return tagObjs;
  }


Future<List<dynamic>> carteNomi(String nome) async {
  List nomi=List();
  if(nome != '')  {
  

    var listaNomi = await fetchNomi(nome);

    for(int i=0;i<listaNomi.length;i++) {
      nomi.add(
        Container(
          height: 40,
          margin: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Card(
            color: Colors.white,
            child: Container(
              child: Text(
                listaNomi[i].nome,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  ),
                textAlign: TextAlign.left,
                ),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(
                horizontal: 20
              ),
            )
          ),
        ),
      );
    }
  }
  return nomi;
}