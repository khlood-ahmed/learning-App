import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'Home.dart';
class AnimatedDefaultTextStyleWidget extends StatefulWidget {
  @override
  _AnimatedDefaultTextStyleWidgetState createState() =>
      _AnimatedDefaultTextStyleWidgetState();
}
class _AnimatedDefaultTextStyleWidgetState
    extends State<AnimatedDefaultTextStyleWidget> {
  
  @override
  Widget build(BuildContext context) {
  /*  TypewriterAnimatedTextKit(
  speed: Duration(milliseconds: 2000),
  totalRepeatCount: 4,
  text: ["do IT!", "do it RIGHT!!", "do it RIGHT NOW!!!"],
  textStyle: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
  pause: Duration(milliseconds: 1000),
  displayFullTextOnTap: true,
  stopPauseOnTap: true,
);
*/
 AnimatedTextKit(
      animatedTexts: [
        FadeAnimatedText(
          'Fade First',
          textStyle: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
        ),
        ScaleAnimatedText(
          'Then Scale',
          textStyle: TextStyle(fontSize: 70.0, fontFamily: 'Canterbury'),
        ),
      ],
    );
    
    return Scaffold(
    body:Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
         // Container(
           // height: 120,
          new Image.asset("assets/background.png",
          height: 300,
          width: 500,
          fit: BoxFit.fill,),
           SizedBox(
        width: 220.0,
      child: ColorizeAnimatedTextKit(
    onTap: () {
       //   Navigator.push(context, MaterialPageRoute(builder: (context){
       //        return Home();
             },  
    text: [
      "Let's Play ",
    ],
    textStyle: TextStyle(
        fontSize: 50.0,
        fontFamily: "Horizon"
     
    ),
    colors: [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ],
    textAlign: TextAlign.start,
  ),
),

          
          RaisedButton(
            color: Colors.amber.shade100,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
              return Home();
             }));
            },
            child: Text(
              "Level One",
            ),
          )
        ],
      ),
    ));
  
  }
  
}

