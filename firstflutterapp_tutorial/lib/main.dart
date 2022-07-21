import 'package:firstflutterapp_tutorial/views/random_words_view.dart';
import 'package:flutter/material.dart';

const randomeWordsView = '/views/randomWords/';
const savedWordsView = '/views/savedWrods';


void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const RandomWords(),
    routes: {
      randomeWordsView:(context) => const RandomWords(),
      savedWordsView:(context) => const RandomWords(),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome')),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: TextButton(
            onPressed: () => Navigator.of(context).pushNamed(randomeWordsView),
            child: const Text('Press here!'),
          ),
        ),
      ),
    );
  }
}
