import 'package:flutter/material.dart';
import 'toplama.dart';
import 'carpma.dart';
import 'cikarma.dart';
import 'bolme.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Çocuklar İçin Test Uygulaması',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF677EFD),
          //primarySwatch: Colors.blue,




      ),
      home:MyHomePage(
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar( title: Text(widget.title),  ),
      body: Center(




        child: Column(


          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              "img/anasayfa_resmi.png",
              width:225,
              height:300,
            ),

            const Text(
              'Çözmeye Başla!',
              style: TextStyle(fontSize:40, fontStyle: FontStyle.italic ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => toplama()),
                );
              },
              child: Ink.image(
                image: AssetImage('img/tpl.png'),
                height:100,
                width:380,
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => cikarma()),
                );
              },
              child: Ink.image(
                image: AssetImage('img/ckrma.jpeg'),
                height:100,
                width:380,
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => carpma()),
                );
              },
              child: Ink.image(
                image: AssetImage('img/carp.jpeg'),
                height:100,
                width:380,
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => bolme()),
                );
              },
              child: Ink.image(
                image: AssetImage('img/bolm.jpeg'),
                height:100,
                width:380,
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
