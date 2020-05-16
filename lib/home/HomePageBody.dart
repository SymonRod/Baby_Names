import 'package:flutter/material.dart';
import 'package:cercanomi/cercanomi/cercanomi.dart' as cercanomi;

class HomePageBody extends StatefulWidget {
  
  @override
  _HomePageBodyState createState() => _HomePageBodyState();

}


class _HomePageBodyState extends State<HomePageBody> {
  


  _HomePageBodyState();
  

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
  
  
  void _test(String text)  async {
    var nomi = await cercanomi.fetchNomi(text);

    for(int i=0; i<nomi.length;i++) {
      print(nomi[i].nome);
      print(nomi[i].lingua);
    }
    
  }

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
            child: TextField( 
              controller: myController,
              onChanged: (String value) {
                _test(value);
              },
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
        ],
    )));
  }
}
