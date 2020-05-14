import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Expanded(
        child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 40,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: TextFormField( 
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(
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

          Container(
            margin: EdgeInsets.only(
              top: 20,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 40,
            ),

            child: DropdownButton(
            ),
          )
        ],
    )));
  }
}
