import 'package:flutter/material.dart';
import 'package:cercanomi/cercanomi/cercanomi.dart';

class HomePageBody extends StatefulWidget {
  
  final  TextEditingController textEditingController = TextEditingController();
  
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {

  void aggiorna() {
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
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
              onEditingComplete: aggiorna,
              controller: widget.textEditingController,
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
        Expanded(
        child: FutureBuilder(
          future: carteNomi(widget.textEditingController.text),
          builder: (context,snapshot) {
            if(!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
            return Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
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
      )
        ],
    )));
  }

}
