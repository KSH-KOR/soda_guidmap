import 'package:firstflutterapp_tutorial/views/random_words_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class savedWords extends StatefulWidget {
  const savedWords({Key? key}) : super(key: key);

  @override
  State<savedWords> createState() => _savedWordsState();
}

class _savedWordsState extends State<savedWords> {

  final _biggerFont = const TextStyle(fontSize: 18);
  final randomView = const RandomWords();

  @override
  Widget build(BuildContext context) {

    randomView._saved;


    final tiles = _saved.map(
      (pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );

    final savedWordsList;

    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: savedWordsList),
      
    );
  }
}