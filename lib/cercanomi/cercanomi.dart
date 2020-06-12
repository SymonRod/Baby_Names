import 'dart:convert';
import 'package:cercanomi/models/Nomi.dart';
import 'package:flutter/material.dart';
import 'package:cercanomi/models/Nome.dart';

import 'httpclient.dart' as httpclient;


Future<List<Nome>> fetchNomi(String nome,List<Lingua> lingue) async {
    String lingueUrl ='';
    lingue.forEach((lingua) {
        if(lingua.isOn) {
          lingueUrl+=lingua.toString()+',';
        }
      }
    );

    String url = 'https://rodopo.altervista.org/api/nomi.php?nome=$nome&lingua=$lingueUrl,&type=json';

    var data = await httpclient.fetchResource(
      url: url,
      );
    
    var jsonData = jsonDecode(data) as List;

    var tagObjs = jsonData.map((tagJson) => Nome.fromJson(tagJson)).toList();
    return tagObjs;
  }


Future<List<dynamic>> carteNomi(String nome,List<Lingua> lingue) async {
  List nomi=List();
  if(nome != '')  {
  
    var listaNomi = await fetchNomi(nome,lingue);

    for(int i=0;i<listaNomi.length;i++) {
      nomi.add(
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 30
          ),
          height: 45,
          child: Card(
            color: Colors.white,
            child: Row(
              children: <Widget>[
                
                //Nome
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),

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
                  ),
                ),

                //Lingua del nome IT o EN es
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    
                    child: Text(
                      listaNomi[i].lingua,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    alignment: Alignment.centerRight,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
  return nomi;
}