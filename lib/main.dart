
import 'package:flutter/material.dart';
import 'package:multimedia/pages/First.dart';
import 'package:multimedia/pages/Home.dart';
import 'package:multimedia/pages/Home_one.dart';
import 'package:multimedia/pages/Screen_two.dart';
import 'package:multimedia/pages/Screen_three.dart';
import 'dart:async';
import 'package:multimedia/pages/level4.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(

      home: AnimatedDefaultTextStyleWidget(), 

    );
}
}


/// Flutter code sample for AnimatedBuilder

// This code defines a widget that spins a green square continually. It is
// built with an [AnimatedBuilder] and makes use of the [child] feature to
// avoid having to rebuild the [Container] each time.

/*
import 'package:flutter/material.dart';
import 'package:multimedia/pages/Home_one.dart';

import 'dart:math' as math;

import 'package:multimedia/pages/Screen_three.dart';
import 'package:multimedia/pages/level4.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 300),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.amber.shade100,
      drawer : Drawer(
        child: ListView(
    children: <Widget>[
      DrawerHeader(
        child: Center(child: Text('Levels',
        style: TextStyle(fontSize: 40,color: Colors.white),
        )),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
      ListTile(
        title: Text('level 2'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
               return Screen_three();
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
     
        body: Container(
          child:AnimatedBuilder(
        animation: _controller,
          child: Center(child: Image.asset('assets/kh.jpg',height: 1000,width: 600,)),
          builder: (BuildContext context, Widget child) {
        return Transform.rotate(
          angle: _controller.value * 1.0 * math.pi,
          child: child,
        );
      },
        ),
      ),
      
    );
  }
}
*/


