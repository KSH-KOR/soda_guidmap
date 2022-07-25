import 'package:boilerplate/theme/textstyle.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primaryColor: const Color.fromRGBO(75, 110, 177, 1),
      drawerTheme: const DrawerThemeData(
        scrimColor:Color.fromRGBO(0, 0, 0, 0),
      ), 
      primarySwatch: Colors.blue,
      primaryTextTheme: const TextTheme(
        headline6: headLineFont,
        subtitle2: substitle2,
        caption: navigationBarLabelFont,
      ),

      bottomNavigationBarTheme: bottomNavigationBarThemeData,
    ),
    home: const HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  Color? bgColorBottomNavigationBar;
  Color? iconColor;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _listenDrawerStatus(isDrawerOpen){
    if(isDrawerOpen){
      bgColorBottomNavigationBar = Theme.of(context).primaryColor;
      iconColor = IconTheme.of(context).color?.withOpacity(0.9) ?? Colors.white60;
    } else{
      bgColorBottomNavigationBar = null; /*BottomNavigationBarTheme.of(context).backgroundColor */
      iconColor = null; /*IconTheme.of(context).color;*/
    }
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'SODA',
          style: Theme.of(context).primaryTextTheme.headline6,
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
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 208, 35),
                child: Text(
                  'SODA',
                  style: Theme.of(context).primaryTextTheme.headline6,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: Text(
                'Icon: favorite',
                style: Theme.of(context).primaryTextTheme.subtitle2,
              ),
            ),
            
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Copyright 2022 SODA Inc. All rights reserved.',
          style: Theme.of(context).primaryTextTheme.subtitle2,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: iconColor,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: iconColor,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
              color: iconColor,
            ),
            label: 'Information',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: iconColor,
            ),
            label: 'Notification',
          ),
        ],
        
        currentIndex: _selectedIndex,
        //selectedLabelStyle: Theme.of(context).primaryTextTheme.caption,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: bgColorBottomNavigationBar,
        onTap: _onItemTapped,
      ),
      onDrawerChanged: (isDrawerOpen){
        _listenDrawerStatus(isDrawerOpen);
      },
    );
  }
}
