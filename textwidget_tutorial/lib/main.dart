import 'package:flutter/material.dart';

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
      appBar: AppBar(title: const Text('data')),
      body: ListView(children: [
        ListTile(
          leading: const Text('Rich Text'),
          title: RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 36),
              children: [
                TextSpan(text: "It's "),
                TextSpan(
                  text: "all ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                TextSpan(
                  text: "Widget!",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const ListTile(
          leading: Text('Selectable rice Text'),
          title: SelectableText.rich(
            TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 36),
                children: [
                  TextSpan(
                    text: "This text is ",
                  ),
                  TextSpan(
                    text: "selectable ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(
                    text: "text!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  )
                ]),
            autofocus: false,
            toolbarOptions: ToolbarOptions(
                copy: true, cut: true, paste: true, selectAll: true),
          ),
        ),
      ]),
    );
  }
}
