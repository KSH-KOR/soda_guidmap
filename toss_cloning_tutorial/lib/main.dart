import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toss_cloning_tutorial/services/navigation_bar/navigation_bar_provider.dart';
import 'package:toss_cloning_tutorial/views/homepage_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BottomNavigationBarProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePageView(),
      ),
    ),
  );
}


