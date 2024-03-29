import 'package:flutter/material.dart';

import 'Question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.indigo,
        scaffoldBackgroundColor: Colors.indigo,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Icon> score = [];
  List<Question> questions = [
    Question(
        question: 'You can lead a cow down stairs but not up stairs.',
        answer: false),
    Question(
      question: 'Approximately one quarter of human bones are in the feet.',
      answer: true,
    ),
    Question(question: 'A slug\'s blood is green.', answer: true)
  ];
  int qNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  questions[qNum].question,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.green,
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    if (questions[qNum].answer){
                      score.add(Icon(Icons.check, color: Colors.green));
                    }
                    else{
                      score.add(Icon(Icons.close, color: Colors.red));
                    }                    if (qNum < (questions.length-1)) {
                      print('questions = ${questions.length} , qNum =$qNum');
                      qNum++;
                    }else{
                      qNum=0;
                    }
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                color: Colors.red,
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    if (!questions[qNum].answer){
                      score.add(Icon(Icons.check, color: Colors.green));
                    }
                    else{
                      score.add(Icon(Icons.close, color: Colors.red));
                    }
                    if (qNum < questions.length-1) {
                      print('questions = ${questions.length} , qNum =$qNum');
                      qNum++;
                    }else{
                      qNum=0;
                    }
                  });
                },
              ),
            ),
          ),
          Row(children: score),
        ],
      ),
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
