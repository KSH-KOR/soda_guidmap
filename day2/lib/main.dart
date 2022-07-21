import 'package:flutter/material.dart';
import 'businessCardView.dart';
import 'myFirstAppView.dart';
import 'mySecondAppView.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ChatListView();
  }
}
