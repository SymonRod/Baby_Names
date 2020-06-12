import 'dart:async';

import 'package:cercanomi/models/Nomi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomePageBody extends StatelessWidget {
  final double horizontalMargin = 40;
  final TextEditingController textEditingController = TextEditingController();

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
            child: InputText()
          ),

          // Carte dei Nomi
          Expanded(
            child: Container(
              child: Consumer<Nomi>(
                builder: (context, nomi, child) =>
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: (nomi.lenght==0?0:nomi.lenght+1),
                    itemBuilder: (context, index) {
                      Container project = nomi.carte[index];
                      return project;
                    },
                  ),
              )
            ), 
          ),       
        ],
      ),
    ));
  }
}

class InputText extends StatefulWidget {
  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> with SingleTickerProviderStateMixin {
  final _searchQuery = new TextEditingController();
  Timer _debounce;
  AnimationController _controller;


  _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 750), () {
      Provider.of<Nomi>(context).aggiornaNomi(_searchQuery.text);
    });
  }

  @override
  void initState() {
    super.initState();
    _searchQuery.addListener(_onSearchChanged);
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _searchQuery.removeListener(_onSearchChanged);
    _searchQuery.dispose();
    _debounce.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    

    return Consumer<Nomi>(
      builder: (context, nomi, child) =>
        TextField(
          controller: _searchQuery,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            focusedBorder: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25),
              borderSide: new BorderSide(
                color: nomi.lenght == 0? nomi.prima? Colors.white: Colors.red:Color(0xFF00BBFF),
              )
            ),

            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25),
              borderSide: new BorderSide(
                color: nomi.lenght == 0? nomi.prima? Colors.white: Colors.red:Color(0xFF00BBFF),
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