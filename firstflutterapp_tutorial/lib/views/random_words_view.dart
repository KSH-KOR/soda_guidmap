import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final List<WordPair> _wordsList = [];
  final _saved = <WordPair>{}; // NEW
  final _biggerFont = const TextStyle(fontSize: 18);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Words List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _pushSaved,
            tooltip: 'Saved Suggestions',
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return const Divider(); /*2*/
          final index = i ~/ 2; /*3*/
          if (index >= _wordsList.length) {
            _wordsList.addAll(generateWordPairs().take(10)); /*4*/
          }
          final isAlreadySaved = _saved.contains(_wordsList[index]);

          return ListTile(
            title: Text(
              _wordsList[index].asPascalCase,
              style: _biggerFont,
            ),
            trailing: Icon(
              // NEW from here ...
              isAlreadySaved ? Icons.favorite : Icons.favorite_border,
              color: isAlreadySaved ? Colors.red : null,
              semanticLabel: isAlreadySaved ? 'Remove from saved' : 'Save',
            ),   
            onTap: () {
              // NEW from here ...
              setState(() {
                if (isAlreadySaved) {
                  _saved.remove(_wordsList[index]);
                } else {
                  _saved.add(_wordsList[index]);
                }
              }); // to here.
            },
          );
        },
      ),
    );
  }

  void _pushSaved() {
    Navigator.of(context).pushNamed(routeName);
  }
}
