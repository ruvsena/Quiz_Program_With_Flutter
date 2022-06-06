import 'package:flutter/material.dart';
import 'toplama.dart';
import 'carpma.dart';
import 'cikarma.dart';
import 'bolme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

 @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      title: 'Çocuklar İçin Test Uygulaması',

      home:MyHomePage(
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(78, 80, 209, 1),
          Color.fromRGBO(149, 219, 229, 1),
        ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        //appBar: AppBar( title: Text(widget.title),  ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                "img/anasayfa_resmi.png",
                width:225,
                height:250,
              ),
              const Text(
                'Çözmeye Başla!',
                style: TextStyle(fontSize:40, fontStyle: FontStyle.normal, fontWeight: FontWeight.w700),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const toplama()),
                          );
                        },
                        child: Container(
                          constraints: const BoxConstraints(minWidth: 10, maxWidth: 120, minHeight: 10, maxHeight: 103),
                          padding: const EdgeInsets.all(15.0),
                          margin: const EdgeInsets.symmetric(vertical:5.0, horizontal:10.0),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 0.27),
                            border: Border.all(color: Colors.blueGrey),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Center(
                            child: Text(
                              '+',
                              style: TextStyle(fontSize: 30.0),),
                          ),
                        ),
                      ),

                      const SizedBox(width: 30,),

                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const cikarma()),
                          );
                        },
                        child: Container(
                          constraints: const BoxConstraints(minWidth: 10, maxWidth: 120, minHeight: 10, maxHeight: 103),
                          padding: const EdgeInsets.all(15.0),
                          margin: const EdgeInsets.symmetric(vertical:5.0, horizontal:10.0),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 0.27),
                            border: Border.all(color: Colors.blueGrey),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Center(
                            child: Text(
                              '-',
                              style: TextStyle(fontSize: 30.0),),
                          ),
                        ),
                      ),
                    ],
                   ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const carpma()),
                      );
                    },
                    child: Container(
                      constraints: const BoxConstraints(minWidth: 10, maxWidth: 120, minHeight: 10, maxHeight: 103),
                      padding: const EdgeInsets.all(15.0),
                      margin: const EdgeInsets.symmetric(vertical:5.0, horizontal:10.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 0.27),
                        border: Border.all(color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Center(
                        child: Text(
                          'x',
                          style: TextStyle(fontSize: 30.0),),
                      ),
                    ),
                  ),

                  const SizedBox(width: 30,),

                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const bolme()),
                      );
                    },
                    child: Container(
                      constraints: const BoxConstraints(minWidth: 10, maxWidth: 120, minHeight: 10, maxHeight: 103),
                      padding: const EdgeInsets.all(15.0),
                      margin: const EdgeInsets.symmetric(vertical:5.0, horizontal:10.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 0.27),
                        border: Border.all(color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Center(
                        child: Text(
                          '%',
                          style: TextStyle(fontSize: 30.0),),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
