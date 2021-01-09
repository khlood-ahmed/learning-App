import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:multimedia/dataa.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

import 'package:multimedia/pages/Home_one.dart';

import 'Home.dart';
import 'Screen_three.dart';


class level4 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DragPicture(),
    );
  }
}

class DragPicture extends StatefulWidget {
  @override
  _DragPictureState createState() => _DragPictureState();
}

class _DragPictureState extends State<DragPicture> {
  List<bool> _isDone = [false, false, false];
  List<bool> elementState = [false, false, false];
  double itemsize = 50;
  double newsize = 70;
  int score=0;
 // var player = AudioCache();
  @override
  void initState() {
   // player.play('song.mp3');
    super.initState();
    reStart();
  }
  void reStart() {
  
       // player.play('song.mp3');
     
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
      title: Text('Your Score ${score}',style:
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
                return Screen_three();
              }));
        },
      ),
      ListTile(
        title: Text('level 4'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
                return Home_one();
              }));
        },
      ),
    ],
  ),
),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 500,
                height: 180,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/board3.png"))),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      children: itemlist.
                           map((item) => Padding(
                                padding: const EdgeInsets.all(20),
                                child: DragTarget<Itemdata>(
                                  onWillAccept: (data) =>
                                      data.name == item.name,
                                  onAccept: (e) {
                                    setState(() {
                                      _isDone[itemlist.indexOf(e)] = true;
                                      elementState[itemlist.indexOf(e)] = true;
                                      score=score+1;
                                    });
                                  },
                                  builder: (BuildContext context, List incoming,
                                      List rejected) {
                                    return _isDone[itemlist.indexOf(item)]
                                        ? Container(
                                            height: newsize,
                                            width: newsize,
                                            child:
                                                SvgPicture.asset(item.address),
                                          )
                                        : Container(
                                            height: itemsize,
                                            width: itemsize,
                                            child: SvgPicture.asset(
                                              item.address,
                                              color: Colors.black45,
                                            ),
                                          );
                                  },
                                ),
                              ))
                          .toList()..shuffle(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 500,
                  height: 120,
                  decoration: BoxDecoration(
                      color: Colors.black87.withOpacity(0.7),
                      border: Border.all(
                          color: Colors.black54.withOpacity(0.8), width: 3)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Wrap(
                        children: itemlist
                            .map((e) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Draggable<Itemdata>(
                                    data: e,
                                    onDragStarted: () {
                                      setState(() {
                                        newsize = 70;
                                      });
                                    },
                                    childWhenDragging: Container(
                                      height: itemsize,
                                      width: itemsize,
                                    ),
                                    feedback: Container(
                                      height: itemsize,
                                      width: itemsize,
                                      child: SvgPicture.asset(e.address),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: elementState[itemlist.indexOf(e)]
                                          ? Container(
                                              width: itemsize,
                                              height: itemsize,
                                            )
                                          : Container(
                                              height: itemsize,
                                              width: itemsize,
                                              child:
                                                  SvgPicture.asset(e.address),
                                            ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ),
              //RaisedButton(child: Text('Close Game'),
                //      onPressed: (){
                  //      exit(0);
                    //  },),
            ],
            
          ),
        ),
      ),
    );
  }
}