import 'package:flutter/material.dart';
import 'dart:async';
//import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;
import 'package:intl/intl.dart' show DateFormat;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:ImageRotate(), 
      ) 
      
    );
  }
}

class ImageRotate extends StatefulWidget {
  @override
  _ImageRotateState createState() => _ImageRotateState();
}

class _ImageRotateState extends State<ImageRotate>
with SingleTickerProviderStateMixin {
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
      vsync: this,
      duration: Duration(seconds: 100),
    );
    controller.repeat();
    
    
  }


  @override
  Widget build(BuildContext context) {
    return Container(
    alignment: Alignment.center,
    color: Colors.black,
    child: AnimatedBuilder(
      animation: controller,
      child: Container(
        height: 200,
        width: 200,
        child: Image.asset('images/deva.png'),
      ),
      builder: (BuildContext context, Widget _widget) {
          return new Transform.rotate(
            angle: controller.value * 180,
            child: _widget,
          );
      }
    ),      
    );
  }
}

class Clock extends StatefulWidget {
  Clock({Key key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {

  DateTime _now = DateTime.now(); // or BinaryTime see next step

  // Tick the clock
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (v) {
      setState(() {
        _now = DateTime.now(); // or BinaryTime see next step
      });
    });
    
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    final hour = DateFormat('hh').format(_now);
    final minute = DateFormat('mm').format(_now);
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              height: 170,
              alignment: Alignment.center,
              //color: Colors.blue,
              child : Text('$hour:$minute',style: TextStyle(fontSize: 170),),
            ),
          )
        ],
      )
    );
  }

  
}