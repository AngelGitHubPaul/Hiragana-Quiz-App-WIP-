import 'package:flutter/material.dart';
import 'package:helloworld/controller.dart';
import 'dart:math';

class Hiragana {
  final String jp;
  final String en;

  Hiragana({required this.jp, required this.en});
}

var rng = Random();
List<Hiragana> hiraganaList = [
  Hiragana(jp: 'あ', en: 'a'),
  Hiragana(jp: 'い', en: 'i'),
  Hiragana(jp: 'う', en: 'u'),
  Hiragana(jp: 'え', en: 'e'),
  Hiragana(jp: 'お', en: 'o'),
  Hiragana(jp: 'か', en: 'ka'),
  Hiragana(jp: 'き', en: 'ki'),
  Hiragana(jp: 'く', en: 'ku'),
  Hiragana(jp: 'け', en: 'ke'),
  Hiragana(jp: 'こ', en: 'ko'),
  Hiragana(jp: 'さ', en: 'sa'),
  Hiragana(jp: 'し', en: 'shi'),
  Hiragana(jp: 'す', en: 'su'),
  Hiragana(jp: 'せ', en: 'se'),
  Hiragana(jp: 'そ', en: 'so'),
  Hiragana(jp: 'た', en: 'ta'),
  Hiragana(jp: 'ち', en: 'chi'),
  Hiragana(jp: 'つ', en: 'tsu'),
  Hiragana(jp: 'て', en: 'te'),
  Hiragana(jp: 'と', en: 'to'),
  Hiragana(jp: 'な', en: 'na'),
  Hiragana(jp: 'に', en: 'ni'),
  Hiragana(jp: 'ぬ', en: 'nu'),
  Hiragana(jp: 'ね', en: 'ne'),
  Hiragana(jp: 'の', en: 'no'),
  Hiragana(jp: 'は', en: 'ha'),
  Hiragana(jp: 'ひ', en: 'hi'),
  Hiragana(jp: 'ふ', en: 'fu'),
  Hiragana(jp: 'へ', en: 'he'),
  Hiragana(jp: 'ほ', en: 'ho'),
  Hiragana(jp: 'ま', en: 'ma'),
  Hiragana(jp: 'み', en: 'mi'),
  Hiragana(jp: 'む', en: 'mu'),
  Hiragana(jp: 'め', en: 'me'),
  Hiragana(jp: 'も', en: 'mo'),
  Hiragana(jp: 'や', en: 'ya'),
  Hiragana(jp: 'ゆ', en: 'yu'),
  Hiragana(jp: 'よ', en: 'yo'),
  Hiragana(jp: 'ら', en: 'ra'),
  Hiragana(jp: 'り', en: 'ri'),
  Hiragana(jp: 'る', en: 'ru'),
  Hiragana(jp: 'れ', en: 're'),
  Hiragana(jp: 'ろ', en: 'ro'),
  Hiragana(jp: 'わ', en: 'wa'),
  Hiragana(jp: 'を', en: 'wo'),
  Hiragana(jp: 'ん', en: 'n'),
];

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);
  _LearnFlutterPageState createState() => _LearnFlutterPageState();
}

class _LearnFlutterPageState extends State<QuizPage> {
  var rngIndex = new List.generate(10, (_) => rng.nextInt(46));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
              onPressed: () {
                debugPrint('Actions');
              },
              icon: const Icon(
                Icons.question_mark_rounded,
              )),
        ],
      ),
      body: QuestionWidget(),
    );
  }
}

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({Key? key}) : super(key: key);
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  late PageController _controller;
  final TextEditingController _textController = new TextEditingController();
  int _questionNumber = 1;
  var rngIndex = List.generate(10, (_) => rng.nextInt(46));

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.symmetric(horizontal: 16.0)),
          Text(
            'Question $_questionNumber/10',
            style: const TextStyle(fontSize: 32.0),
          ),
          Expanded(
            child: PageView.builder(
                itemCount: 10,
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (content, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 275,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  hiraganaList[rngIndex[index].toInt()].jp,
                                  style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 75.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Form(
                        key: formKey,
                        child: Container(
                          width: 250,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                controller: _textController,
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'please input answer';
                                  } else if (value !=
                                      hiraganaList[rngIndex[index].toInt()]
                                          .en) {
                                    return 'wrong answer please try again';
                                  }
                                },
                                decoration:
                                    const InputDecoration(labelText: 'Answer'),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              ElevatedButton(
                                child: Text(
                                    _questionNumber < 10 ? 'Submit' : 'Finish'),
                                onPressed: () {
                                  setState(() {
                                    if (formKey.currentState!.validate()) {
                                      if (_questionNumber < 10) {
                                        _textController.clear();
                                        _controller.nextPage(
                                            duration: const Duration(
                                                milliseconds: 250),
                                            curve: Curves.easeInExpo);
                                        _questionNumber++;
                                      } else {
                                        Navigator.of(context).pop();
                                      }
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
