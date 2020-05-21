import 'package:cercanomi/models/Nomi.dart';
import 'package:flutter/material.dart';
import 'package:cercanomi/cercanomi/cercanomi.dart';
import 'package:provider/provider.dart';

import '../cercanomi/cercanomi.dart';

class HomePageBody extends StatefulWidget {
  final TextEditingController textEditingController = TextEditingController();

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  double horizontalMargin = 40;
  Color coloreInput = Colors.blueAccent;
  List<dynamic> listaNomi ;

  void aggiorna() async {
    listaNomi = await carteNomi(widget.textEditingController.text);

    setState(() {
      if(listaNomi.length == 0){
        coloreInput = Colors.red;
      } else {
        coloreInput = Colors.green;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return (Expanded(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 20,
              bottom: 5,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: horizontalMargin,
            ),
            child: Consumer<Nomi>(
              builder: (context, nomi, child) =>
                TextField(
                  onEditingComplete: () {
                    nomi.aggiornaNomi(widget.textEditingController.text);
                  },
                  controller: widget.textEditingController,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25),
                      borderSide: new BorderSide(
                        color: nomi.lenght == 0? nomi.prima? Colors.white: Colors.red:Colors.green,
                      )
                    ),

                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25),
                      borderSide: new BorderSide(
                        color: nomi.lenght == 0? nomi.prima? Colors.white: Colors.red:Colors.green,
                      ),
                    ),
                    hintText: "Cerca un nome!",
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
            ),
          ),

          // Carte dei Nomi
          Expanded(
            child: Consumer<Nomi>(
              builder: (context, nomi, child) => 
                Container(
                  
                  child: ListView(
                    children: nomi.carte,
                  )
                ),
            ), 
          ),        
        ],
      ),
    ));
  }
}
