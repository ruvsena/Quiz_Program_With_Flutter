import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';

class carpma extends StatefulWidget {
  const carpma({Key key}) : super(key: key);

  @override
  _carpmaState createState() => _carpmaState();
}

class _carpmaState extends State<carpma>{
  int _questionIndex = 0 ;
  int _totalScore = 0;
  bool answerWasSelected=false;
  bool endOfQuiz=false;
  bool correctAnswerSelected = false;

  void _questionAnswered(bool answerScore){
    setState(() {
      answerWasSelected=true;
      if(answerScore){
        _totalScore++;
        correctAnswerSelected =true;
      }


      if(_questionIndex +1 ==_questions.length){
        endOfQuiz=true;
      }
    });
  }

  void _nextQuestion() {
    setState((){
      _questionIndex++;
      answerWasSelected =false;
      correctAnswerSelected=false;
    });
    if(_questionIndex >=_questions.length){_resetQuiz();  }
  }

  void _resetQuiz() {
    setState((){
      _questionIndex=0;
      _totalScore=0;
      endOfQuiz=false;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
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
        child: Center(
          child: Column(

            children:[
              const SizedBox(height: 30.0),
              Image.asset(
                "img/anasayfa_resmi.png",
                width:150,
                height:200,
              ),
              const SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                height: 130.0,
                margin: const EdgeInsets.only(bottom: 10.0,left: 30.0,right: 30.0),
                padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical:20.0),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color.fromRGBO(254, 165, 165, 0.9),
                    Color.fromRGBO(149, 219, 229, 0.9),
                  ]),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    _questions[_questionIndex]['question'],
                    textAlign:TextAlign.center,
                    style: const TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ...(_questions[_questionIndex]['answers']
              as List<Map<String, Object>>)
                  .map(
                    (answer) => Answer(
                  answerText: answer['answerText'],
                  answerColor: answerWasSelected
                      ? answer['score']
                      ? const Color.fromRGBO(112, 255, 0, 0.56)
                      : const Color.fromRGBO(255, 0, 0, 0.72)
                      : const Color.fromRGBO(255, 255, 255, 0.27),
                  answerTap: () {
                    if (answerWasSelected) {return;}
                    _questionAnswered(answer['score']);
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              if(answerWasSelected)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary:const Color.fromRGBO(78, 80, 209, 0.8),
                  //minimumSize: Size(double.infinity,40.0),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                ),
                onPressed: () {
                  if(!answerWasSelected){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Lütfe bir sonraki soruya geçmek için bir sayı seçin.'),
                    ));
                    return;

                  }
                  else if(endOfQuiz){
                    Navigator.pop(context);
                  }
                  _nextQuestion();
                },
                child: Text(endOfQuiz ? 'Anasayfaya Dön' : 'Sonraki Soru'),
              ),
              const SizedBox(height: 3.0),

              if (endOfQuiz)
                Container(
                  height: 50,
                  width: double.infinity,
                  color: const Color.fromRGBO(241, 199, 48, 0.6),
                  margin: const EdgeInsets.only(bottom: 10.0,left: 80.0,right: 80.0,top: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical:5.0),

                  child: Center(
                    child: Text(
                      'Harika! Puanın: $_totalScore/6',
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
const _questions=[
  {
    'question' : '3 x 2 = ?',
    'answers':[
      {'answerText': '9','score': false},
      {'answerText': '6','score': true},
      {'answerText': '7','score': false},
    ],
  },
  {
    'question' : '2 x 4 = ?',
    'answers':[
      {'answerText': '8','score': true},
      {'answerText': '9','score': false},
      {'answerText': '6','score': false},
    ],
  },
  {
    'question' : '6 x 2 = ?',
    'answers':[
      {'answerText': '10','score': false},
      {'answerText': '8','score': false},
      {'answerText': '12','score': true},
    ],
  },
  {
    'question' : '5 x 2 = ?',
    'answers':[
      {'answerText': '10','score': true},
      {'answerText': '9','score': false},
      {'answerText': '12','score': false},
    ],
  },
  {
    'question' : '6 x 3 = ?',
    'answers':[
      {'answerText': '12','score': false},
      {'answerText': '14','score': false},
      {'answerText': '18','score': true},
    ],
  },
  {
    'question' : '8 x 2 = ?',
    'answers':[
      {'answerText': '12','score': false},
      {'answerText': '16','score': true},
      {'answerText': '18','score': false},
    ],
  },
];