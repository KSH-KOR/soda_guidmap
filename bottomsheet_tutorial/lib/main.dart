import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        //body: const HomePage(),
        bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Text('Copyright 2022 SODA All rights reserved.',
                  ),
            ),
          ),
        ],
      ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          
        },),
      ),
      
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: const Text('show bottom sheet'),
        onPressed: () {
          Scaffold.of(context).showBottomSheet<void>( // in order to call Scaffold.of(context), 'Scaffold' should be preceded.
            (context) => Container(
              height: 200,
              color: Colors.amberAccent,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('BottomSheet'),
                    ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
