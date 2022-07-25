import 'package:boilerplate2/theme/text_theme_constants.dart';
import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  const MyListTile(
      {Key? key,
      required this.title,
      required this.leading,
      required this.subtitle})
      : super(key: key);

  final String title;
  final Icon leading;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.5, horizontal: 8),
      child: Card(
        elevation: 0,
        shape: const BeveledRectangleBorder(
          side: BorderSide(
            width: 0.2,
            color: Color.fromRGBO(151, 151, 151, 1),
          ),
        ),
        child: ListTile(
          dense: true,
          leading: leading,
          title: Text(
            title,
            style: Theme.of(context)
                .primaryTextTheme
                .headline6!
                .copyWith(color: Colors.black),
          ),
          subtitle: Text(
            subtitle,
            // style: listTileSubtitle,
          ),
          horizontalTitleGap: 5,
        ),
      ),
    );
  }
}

class MyListView extends StatelessWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 400),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          children: [
            const MyListTile(
              leading: Icon(Icons.airplay_outlined),
              title: 'This is List tile',
              subtitle: 'List tile 1',
            ),
            const MyListTile(
              leading: Icon(Icons.airplay_outlined),
              title: 'This is List tile',
              subtitle: 'List tile 2',
            ),
            const MyListTile(
              leading: Icon(Icons.airplay_outlined),
              title: 'This is List tile',
              subtitle: 'List tile 3',
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'TEXT BUTTON',
                  style: textButton,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MySettingButton extends StatelessWidget {
  const MySettingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {},
          color: Colors.white,
        ),
      ],
    );
  }
}

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Text('Copyright 2022 SODA All rights reserved.',
                  style: Theme.of(context).primaryTextTheme.subtitle2),
            ),
          ),
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(
        title,
        style: Theme.of(context).primaryTextTheme.headline6,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key, required this.headerTitle}) : super(key: key);

  final String headerTitle;

  @override
  Widget build(BuildContext context) {
    
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 208, 35),
              child: Text(
                headerTitle,
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
    );
  }
}
