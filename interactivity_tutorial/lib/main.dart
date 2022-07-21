import 'package:flutter/material.dart';
import 'package:interactivity_tutorial/views/description_view.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const DescriptionView(),
  ));
}