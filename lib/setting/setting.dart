import 'package:cercanomi/models/Nomi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Setting extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:  Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            child: Text(
              'Impostazioni',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Abel',
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),

          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  // Text(
                  //   'Lingue incluse nella ricerca:',
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontFamily: 'Montserrat'
                  //   ),
                  // ),
                  
                  Container(
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.circular(25),
                      border: Border.all(color: Colors.white),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        selectedItemBuilder: (BuildContext context) {
                          return <Widget> [Container(width:150,alignment: Alignment.center,child:Text('Lingue',textAlign: TextAlign.center,))];
                        },
                        onChanged: (temp) {
                        },
                        items: [
                          DropdownMenuItem(
                            child: Consumer<Nomi>(
                              builder: (context, nomi, child) =>
                                Container(
                                  child: CheckboxListTile(
                                    title: Text('Italiano'),
                                    value: nomi.getLinguaFromValue('IT'),
                                    onChanged: (bool isOn) {
                                      Provider.of<Nomi>(context).aggiornaLingua('IT', isOn);
                                    },
                                  ),
                                ),
                            ),
                          ),
                          DropdownMenuItem(
                            child: Consumer<Nomi>(
                              builder: (context, nomi, child) =>
                                CheckboxListTile(
                                  title: Text('Inglese'),
                                  value: nomi.getLinguaFromValue('EN'),
                                  onChanged: (bool isOn) {
                                    Provider.of<Nomi>(context).aggiornaLingua('EN', isOn);
                                  },
                              ),
                            ),
                          ),
                        ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}