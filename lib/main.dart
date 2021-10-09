import 'package:flutter/material.dart';

// Custom Widgets files
import './question.dart';
import './answer.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() => runApp(const MyApp());

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyappState();
  }
}

class _MyappState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    // ignore: avoid_print
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'question': 'What\'s your favorite color ?',
        'options': ['Black', 'Red', 'Green', 'Blue']
      },
      {
        'question': 'What\'s your favorite animal ?',
        'options': ['Elephant', 'Lion', 'Tiget', 'Bear']
      },
      {
        'question': 'Who\'s your favorite cricket player ?',
        'options': ['Kohli', 'Raina', 'Dhoni', 'Sachin']
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First Flutter App'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['question'].toString(),
            ),
            ...(questions[_questionIndex]['options'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
