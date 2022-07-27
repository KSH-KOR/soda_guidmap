import 'package:flutter/material.dart';
import 'items/widgets.dart';
import 'theme/text_theme_constants.dart';
import 'theme/theme_constants.dart';
import 'utils/helper_widgets.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: lightTheme,
    home: const HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'SODA'),
      drawer: const MyDrawer(headerTitle: 'SODA'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DAY 8',
              style: Theme.of(context).primaryTextTheme.headline3,
            ),
            addVerticalSpace(20),
            const OutlinedCard(
              child: OutlinedCardChild(),
            ),
            addVerticalSpace(5),
            const MyChoiceChips(),
          ],
        ),
      ),
      floatingActionButton: Container(
        
        alignment: const Alignment(1, 0.9),
        child: Tooltip(
          message: "Tooltip",
          showDuration: const Duration(seconds: 3),
          preferBelow: false,
          child: FloatingActionButton(
            onPressed: () async {},
            child: const Icon(Icons.add),
          ),
        ),
      ),
      bottomSheet: const MyBottomSheet(),
    );
  }
}

