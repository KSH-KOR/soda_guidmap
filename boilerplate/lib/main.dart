import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
    routes: {},
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final headLineFont = const TextStyle(
    fontFamily: 'Roboto',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: Colors.white,
  );
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    
  );
  final labelFont = const TextStyle(
    fontFamily: 'Roboto',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: Color.fromRGBO(151, 151, 151, 1),
  );
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(75, 110, 177, 1),
        title: Text(
          'SODA',
          style: headLineFont,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(24, 41, 73, 1),
              ),
              child: Text(
                'Drawer Header',
                style: headLineFont,
              ),
            ),
            const ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Icon: favorite'),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Copyright 2022 SODA Inc. All rights reserved.',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Color.fromRGBO(0, 0, 0, 0.6),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Information',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(75, 110, 177, 1),
        unselectedItemColor: const Color.fromRGBO(151, 151, 151, 1),
        unselectedLabelStyle: labelFont,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
