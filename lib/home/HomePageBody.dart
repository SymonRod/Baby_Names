import 'package:cercanomi/models/Nome.dart';
import 'package:flutter/material.dart';
import 'package:cercanomi/cercanomi/cercanomi.dart';

class HomePageBody extends StatefulWidget {
  final TextEditingController textEditingController = TextEditingController();

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  double horizontalMargin = 40;
  Color coloreInput = Colors.blueAccent;


  void aggiorna() {

    setState(() {});
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
                    color: coloreInput,
                  )
                ),

                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25),
                  borderSide: new BorderSide(
                    color: coloreInput,
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

          // Carte dei Nomi
          Expanded(
            child: FutureBuilder(
              future: carteNomi(widget.textEditingController.text),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  
                  var ciao = List.castFrom(snapshot.data);

                  if(ciao.length == 0) {
                    coloreInput = Colors.red;
                  } else {
                    coloreInput = Colors.green;
                  }
                  
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        Container project = snapshot.data[index];
                        return project;
                      },
                    ),
                  );
                }
              },
            ),
          ),
          
        ],
      ),
    ));
  }
}
