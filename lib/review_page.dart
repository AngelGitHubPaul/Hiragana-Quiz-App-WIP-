import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Hiragana {
  final String jp;
  final String en;

  Hiragana({required this.jp, required this.en});
}

final List<Hiragana> hiragana = [
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
  Hiragana(jp: '', en: ''),
  Hiragana(jp: 'ゆ', en: 'yu'),
  Hiragana(jp: '', en: ''),
  Hiragana(jp: 'よ', en: 'yo'),
  Hiragana(jp: 'ら', en: 'ra'),
  Hiragana(jp: 'り', en: 'ri'),
  Hiragana(jp: 'る', en: 'ru'),
  Hiragana(jp: 'れ', en: 're'),
  Hiragana(jp: 'ろ', en: 'ro'),
  Hiragana(jp: 'わ', en: 'wa'),
  Hiragana(jp: '', en: ''),
  Hiragana(jp: 'を', en: 'wo'),
  Hiragana(jp: '', en: ''),
  Hiragana(jp: 'ん', en: 'n'),
];

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: hiragana.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
      itemBuilder: (context, index) => Card(
          child: GridTile(
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
            Text(
              (hiragana[index].jp),
              style: TextStyle(
                color: Colors.pink,
                fontSize: 20.0,
              ),
            ),
            Text(hiragana[index].en),
          ])))),
    );
  }
}
