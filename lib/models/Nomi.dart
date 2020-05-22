import 'dart:collection';

import 'package:flutter/material.dart';
import '../cercanomi/cercanomi.dart';
import 'Nome.dart';

class Nomi extends ChangeNotifier {
  final List<Nome> _nomi = [];
  final List<Container> _nomiContainer = [];
  bool _prima = true;

  UnmodifiableListView<Nome> get nomi => UnmodifiableListView(_nomi);
  get carte => _nomiContainer;
  get lenght => _nomi.length;
  get prima => _prima;

  void aggiornaNomi(String nome)  async {
    if(nome != '')  {
      var tempNomi = await fetchNomi(nome);

      _nomi.clear();

      tempNomi.forEach((Nome nomeTemp) {
          _nomi.add(nomeTemp);
        }
      );

      print(tempNomi.length);

      _nomiContainer.clear();
      
      var tempContainer = getContainer();

      tempContainer.forEach((Container nomeContainerTemp) {
          _nomiContainer.add(nomeContainerTemp);
        }
      );

      _prima=false;
      notifyListeners();
    }
  }

  List<Container> getContainer() {
    List<Container> nomi = List();

    nomi.add(Container(
      margin : EdgeInsets.symmetric(
        horizontal: 30
      ),
      height: 45,
      child: Card(
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal:10,
          ),
          alignment: Alignment.centerLeft,
          child: Text(
            (_nomi.length==1?'È stato trovato ':'Sono stati trovati ')+_nomi.length.toString()+(_nomi.length==1?' nome':' nomi'),      
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
      )
    );

    for(int i=0;i<_nomi.length;i++) {
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
                      _nomi[i].nome,
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
                      _nomi[i].lingua,
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
    return nomi;
  }
}