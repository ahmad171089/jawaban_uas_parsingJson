import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart'; as http;
import 'dart:async';
import 'dart: convert';

void main() {
  runApp(new MaterialApp(
    title: "List View",
    home: new Home(),
  ));
}

class Home extends StatefulWidget{
  @override
  _HomeState createState()=> new _homeState();
}

class _HomeState extends State<Home> {

  List dataJSON;

  Future<String> ambildata() async{
    http.Response hasil = await http.get(
      Uri.encodeFull(https://jsonplaceholder.typicode.com/posts), headers: {
        "Accept": "application/json"
      } 
    );

    this.setState(() {

      dataJSON = JSON.decode(hasil.body);
      
    });
  }

  @override
  void initState(){
    this.ambildata();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(

    appBar: new appBar(title: new Text("List Data Json"),),

    Body: new ListView.builder(
      itemCount: dataJSON == null ? 0 : dataJSON.length,
      itemBuilder: (context,i){
        return new Card(child: new Text(dataJson[i]['title']),);
      },
    )
  }
}
