import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helloworld/quiz_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          'Are you ready to test your Hiragana reading skills?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.pink,
            fontSize: 25.0,
          ),
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const QuizPage();
                  },
                ),
              );
            },
            child: Container(
              child: const Text('Start Quiz!'),
              padding: const EdgeInsets.all(10.0),
            ),
          ),
        ),
      ],
    );
  }
}
