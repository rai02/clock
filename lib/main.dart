import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;
import 'package:intl/intl.dart' show DateFormat;
void main()
{
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  runApp(MyApp());
}  


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
  DateTime _now = DateTime.now();
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (v) {
      setState(() {
        _now = DateTime.now(); // or BinaryTime see next step
      });
    });
    controller = new AnimationController(
      vsync: this,
      duration: Duration(seconds: 60),
    );
    controller.repeat();
    super.initState();
    
    
  }


  @override
  Widget build(BuildContext context) {
    final hour = DateFormat('hh').format(_now);
    final minute = DateFormat('mm').format(_now);
    final sec = DateFormat('ss').format(_now);
    final mnth = DateFormat('MM').format(_now);
    final date = DateFormat('dd').format(_now);
    final yr = DateFormat('y').format(_now);
    final day = DateFormat('EEEE').format(_now);


    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        Container(
        alignment: Alignment.center,
        //color: Colors.black,
        decoration: BoxDecoration(
        // Box decoration takes a gradient
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          // Add one stop for each color. Stops should increase from 0 to 1
          //stops: [0.1, 0.5, 0.7, 0.9],
          stops: [0.5, 0.5],

          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            //Colors.indigo[800],
            //Colors.indigo[700],
            //Colors.indigo[600],
            //Colors.indigo[400],
            Colors.deepPurple,
            Colors.black,

          ],
        ),
      ),
        child: AnimatedBuilder(
          animation: controller,
          child: Container(
            height: 750,
            width: 750,
            child: Image.asset('images/deva2.png'),
          ),
          builder: (BuildContext context, Widget _widget) {
              return new Transform.rotate(
                angle: controller.value * 5,
                child: _widget,
              );
          }
        ),      
        ),
        Container(
          //height: 300,
          alignment: Alignment.bottomRight,
          //color: Colors.blue,
          child : Text('$hour:$minute:$sec',style: TextStyle(fontSize: 150, color: Colors.white,fontFamily: 'Pacifico'),),
        ),
        Container(
          height: 800,
          alignment: Alignment.topLeft,
          //color: Colors.blue,
          child : Text('$date.$mnth.$yr\n$day',style: TextStyle(fontSize: 75, color: Colors.white,fontFamily: 'Pacifico'),),
        )
      ],
    );
  }
}
