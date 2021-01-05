
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:multimedia/pages/Home_one.dart';

import 'Home.dart';
import 'level4.dart';


class Screen_three extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Screen_three>{

  var player = AudioCache();
  Map<String,bool> score = {};
  // var score ;
  Map<String, String> choices = {
    'ن' : 'ا ر - ب',
    'ا' : 'ز ر  - ف ة',
    'ل': 'ك - ب ',
    'ر' : 'ق - د ',
    'ز' : 'غ - ا ل ة',
    'ع' : 'م - ز ة',
    'ف' : 'ع ص - و ر ة',

  };
  int index = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: Text('Your Score ${score.length} / 7',style:
      TextStyle(
        color: Colors.black
      ),),
        backgroundColor: Colors.amber.shade100,
      ),
         drawer : Drawer(
  child: ListView(
    children: <Widget>[
      DrawerHeader(
        child: Center(child: Text('Levels',
        style: TextStyle(fontSize: 40,color: Colors.black),
        )),
        decoration: BoxDecoration(
          color: Colors.amber.shade100,
        ),
      ),
      ListTile(
        title: Text('level 1'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
               return Home();
             }));
        },
      ),
      ListTile(
        title: Text('level 3'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
                return Home_one();
              }));
        },
      ),
      ListTile(
        title: Text('level 4'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
                return level4();
              }));
        },
      ),
    ],
  ),
),
      floatingActionButton: FloatingActionButton(
        backgroundColor :Colors.amber.shade100,
      child: Icon(Icons.refresh,color:Colors.black,),
        onPressed: (){
          setState(() {
            score.clear();
            index++;
          });
        },
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              height: 450,
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: choices.keys.map((emoji){
                  return Expanded(
                    child:Draggable<String>(
                      data: emoji,
                      child: Movable(emoji :score[emoji] == true ? '✔️' : emoji),
                      feedback:Movable(emoji: emoji),
                      childWhenDragging:Movable(emoji: '🌾',),
                    ),
                  );
                }).toList()..shuffle(Random(index)),
              )),
          Container(
              width: 140,
              height: 450,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: choices.keys.map((emoji) {
                  return buildTarget(emoji);
                }).toList(),
              ) ),
          //IconButton(
            //icon: Icon(Icons.next_plan_outlined),
            //color: Colors.blue,
            //iconSize: 50,
            //onPressed: () {
             // Navigator.push(context, MaterialPageRoute(builder: (context){
             //   return Home_one();
           //   }));
         //   },)
          //RaisedButton(
          //width:,
          //child: Icon(Icons.next_plan),
          // onPressed: (){
          //Navigator.push(context, MaterialPageRoute(builder:(context){
          //  return Screen_two();
          //  }));
          //  },
          // ),
        ],
      ),
    );
  }
  Widget buildTarget(emoji){
    return DragTarget<String>(
      builder: (BuildContext context , List <String> incoming , List rejected ){
        if(score[emoji]== true){
          return Container(

            //color: Colors.white,
            child: Text('Congratulations!'),
            // alignment: Alignment.center,
            width: 150,
            // height: 80,
          );
        } else {
          return Container(
            width: 150,
            child:Text (choices[emoji],style: TextStyle(fontSize: 30),), //bdl color hktb text 34an mfrod arg3 eli m3aia zai ma kan
            // height: 60,
            // width: 60,
          );
        }
      },
      onWillAccept : (data) => data == emoji,
      onAccept : (data) {
        setState(() {
          score[emoji] = true;
          player.play('clap.mp3');
        });
      },
      onLeave: (data){},
    );
  }
}

class Movable extends StatelessWidget{
  final String emoji;
  Movable({Key key,this.emoji}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment :Alignment.center,
        height : 50,
        padding : EdgeInsets.all(10),
        child : Text(
          emoji ,
          style: TextStyle(color: Colors.red,fontSize:33,),
        ),
      ),
    );
  }
}