import 'package:flutter/material.dart';
import 'cercanomi.dart' as cercanomi;

class CarteNomi extends StatefulWidget{
  
  final TextEditingController textController;
  
  CarteNomi({Key key ,this.textController}) :   super(key: key);

  @override
  CarteNomiState createState() => CarteNomiState();
}

class CarteNomiState extends State<CarteNomi> {

  void help() {
    setState(() {
      
    });
  }

  aggiorna() => {
    help()
  };

  @override
  Widget build(BuildContext context)  {
    return(
      Expanded(
        child: FutureBuilder(
          future: cercanomi.carteNomi(widget.textController.text),
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
    );
  } 

}