import 'package:boilerplate2/items/widgets.dart';
import 'package:boilerplate2/theme/text_theme_constants.dart';
import 'package:boilerplate2/theme/theme_constants.dart';
import 'package:boilerplate2/utils/helper_widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: lightTheme,
    home: const HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'SODA'),
      drawer: const MyDrawer(headerTitle: 'SODA'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyListView(),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MySettingButton(),
                addVerticalSpace(10),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Outlined Button',
                    style: textButton,
                  ),
                ),
                addVerticalSpace(15),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const MyBottomAppBar(),
    );
  }
}
