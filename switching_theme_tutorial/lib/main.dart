import 'package:flutter/material.dart';
import 'package:switching_theme_tutorial/theme/theme_constants.dart';
import 'package:switching_theme_tutorial/theme/theme_manager.dart';
import 'package:switching_theme_tutorial/utils/helper_widgets.dart';

final _themeManager = ThemeManager();
void main() {
  //late final _themeManager = ThemeManager();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: lightTheme,
    darkTheme: darkTheme,
    themeMode: _themeManager.themeMode,
    home: const HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final _themeManager = ThemeManager();
  final _title = "Theme app";

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }
  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }
  themeListener(){
    if(mounted){
      setState(() {
        
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: [
          Switch(
              value: _themeManager.themeMode == ThemeMode.dark,
              onChanged: (newVal) {
                _themeManager.toggleTheme(newVal);
              }),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/profile_pic.png',
              height: 200,
              width: 200,
            ),
            addVerticalSpace(10),
            const Text('Your name'),
            addVerticalSpace(10),
            const Text('@yourusername'),
            addVerticalSpace(20),
            const TextField(),
            addVerticalSpace(10),
            ElevatedButton(
              onPressed: () {},
              child: const Text('just click'),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
