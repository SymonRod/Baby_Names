import 'package:flutter/material.dart';
import 'package:cercanomi/cercanomi/CarteNomi.dart';

class HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    GlobalKey<CarteNomiState> _carteNomikey = GlobalKey<CarteNomiState>();
    
    textEditingController.text = 'Ciao Mondo';

    return (Expanded(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 70,
              bottom: 5,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: TextField(
              
              controller: textEditingController,
              onEditingComplete: () => _carteNomikey.,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(),
                ),
                hintText: "Cerca un nome!",
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ),
          CarteNomi(
            key: _carteNomikey,
            textController: textEditingController,
          ),
        ],
    )));
  }

}
