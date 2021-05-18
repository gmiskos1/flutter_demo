import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  //can be rebuild

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\s your favorite Color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'red', 'score': 8},
        {'text': 'Green', 'score': 5},
        {'text': 'White', 'score': 3}
      ],
    },
    {
      'questionText': 'What\s your favorite Animal?',
      'answers': [
        {'text': 'cat', 'score': 10},
        {'text': 'dog', 'score': 8},
        {'text': 'pig', 'score': 5},
        {'text': 'cow', 'score': 3}
      ],
    },
    {
      'questionText': 'What\s your favorite Instructor?',
      'answers': [
        {'text': 'Max', 'score': 10},
        {'text': 'Ron', 'score': 8},
        {'text': 'Mark', 'score': 5},
        {'text': 'Nick', 'score': 3}
      ],
    },
  ];
  // the state is persistent
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      //re render
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: (_questionIndex < _questions.length)
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
