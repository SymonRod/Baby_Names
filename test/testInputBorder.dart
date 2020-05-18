import 'package:flutter/material.dart';

class TestInputBorder extends StatefulWidget  {

  Function aggiorna;
  TextEditingController textEditingController;
  


  @override
  _TestInputBorderState createState() => _TestInputBorderState();
}

class _TestInputBorderState extends State<TestInputBorder> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      child: TextField(
              onEditingComplete: aggiorna,
              controller: widget.textEditingController,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                focusedBorder: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25),
                  borderSide: new BorderSide(
                    color: Colors.white,
                  )
                ),

                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25),
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
    );
  }

  
}