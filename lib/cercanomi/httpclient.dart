import 'dart:async';
import 'dart:convert';
import 'dart:io';

Future<String>  fetchResource({String  url}) async {
  try {
    final client = HttpClient();

    //Impostiamo il timeout

    client.connectionTimeout = Duration(seconds: 10);

    //Prepraro la richiesta GET
    var request = await client.getUrl(Uri.parse(url));

    //Mando richiesta al server e attendo risposta
    var response = await request.close();

    //Stampo il codice di risposta del server
    print('Status code: ${response.statusCode}');

    if(response.statusCode != 200)  throw 'Http error ${response.statusCode}';

    //Preleviamo i dati dal body della richiesta
    var data = await response.transform(utf8.decoder).join();

    return data;

  } on TimeoutException catch(e) {
    throw 'Errore di Timeout';
  } on SocketException catch(e) {
    throw 'Errore. Controllare che la connesione a internet sia attiva';
  } catch(e)  {
    throw 'Errore nel download';
  }
}