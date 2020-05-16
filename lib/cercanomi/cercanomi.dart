import 'dart:convert';

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
