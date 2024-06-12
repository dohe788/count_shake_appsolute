import 'package:flutter/material.dart';
import 'package:shake/shake.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  int _counter = 0;
  late ShakeDetector detector;
  @override
  void initState(){
    WidgetsBinding.instance.addObserver(this);
    ShakeDetector.autoStart(
        onPhoneShake: (){
          setState(() {
            _counter++;
          });
        },
      shakeThresholdGravity: 1.5,
    );
    super.initState();
  }
  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
  backgroundColor: Colors.blueAccent,

        title: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Padding(padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
         child: Text(
           '흔들어서 카운트 올려',
           style: TextStyle(
             fontSize: 24,
             fontWeight: FontWeight.bold,
             color: Colors.blueAccent,

           ),
           textAlign:TextAlign.center,
         ),

         ),
       Container(
         width: 120,
         height: 120,
         decoration: BoxDecoration(
         color: Colors.blue[200],
           shape: BoxShape.circle,
           boxShadow: [
             BoxShadow(
                 color:Colors.grey.withOpacity(0.5),
               spreadRadius: 5,
               blurRadius: 7,
               offset: Offset(0,3),
             ),

           ],
       ),
         child: Center(
           child: Text(
               '$_counter',
             style: TextStyle(fontWeight: FontWeight.bold,
    fontSize: 48,
    color: Colors.white,
           ),


         ),
       ),
    ),
           ],
     ),
       ),
    );
  }
}
void main(){
  runApp(MaterialApp(
    home: MyHomePage(title: 'Shake Counter'),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
  ));
}