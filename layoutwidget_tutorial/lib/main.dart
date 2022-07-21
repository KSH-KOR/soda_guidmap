import 'package:flutter/material.dart';

import 'constants/routes.dart';
import 'layoutTestViews/singleChildLayoutTestView.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
      routes: {
        singleLayoutTestView: (context) => const SingleLayoutTest(),
      }
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('layout test model')),
      body: Center(
          child: Row(
        children: [
          TextButton(
            onPressed: () =>
                {Navigator.of(context).pushNamed(singleLayoutTestView),},
            child: Container(
              padding: const EdgeInsets.all(20),
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue[100],
              ),
              child: const Center(
                child: Text(
                  'single child layout test',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

