/*
Here are the most common ways to manage state:
  1. The widget manages its own state
  2. The parent manages the widget’s state
  3. A mix-and-match approach

How do you decide which approach to use? The following principles should help you decide:
  1. If the state in question is user data, 
    for example the checked or unchecked mode of a checkbox, or the position of a slider, 
    then the state is best managed by the parent widget.
  2. If the state in question is aesthetic, 
    for example an animation, 
    then the state is best managed by the widget itself.

  3. If in doubt, start by managing state in the parent widget.
*/

import 'package:flutter/material.dart';

import 'a_mix_and_match_approach.dart';
//import 'package:managingstate_tutorial/the_widget_manages_its_own_state.dart';

//import 'The_parent_widget_manages_the_widgets_state.dart';

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
    return Scaffold(
      appBar: AppBar(title: const Text('managing state tutorial')),
      body: const Center(child: ParentWidget()),
    );
  }
}
