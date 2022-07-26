import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
      body: const ExpasionPanelList(),
    );
  }
}

class Item {
  Item({
    required this.title,
    required this.description,
    this.isExpanded = false,
  });

  final String title;
  final String description;
  bool isExpanded;

  Item.fromMap(Map<String, Object?> map)
      : title = map['map'] as String,
        description = map['description'] as String,
        isExpanded = false;
}

List<Item> _cacheIthem = [];

class ItemService {
  void createItem(String title, String description) {}

  void updateCache(List<Item> item) {
    _cacheIthem = item;
  }

  void deleteItem(String title) {}
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      title: 'Panel $index',
      description: 'This is item number $index',
    );
  });
}

class ExpasionPanelList extends StatefulWidget {
  const ExpasionPanelList({Key? key}) : super(key: key);

  @override
  State<ExpasionPanelList> createState() => _ExpasionPanelListState();
}

class _ExpasionPanelListState extends State<ExpasionPanelList> {
  final List<Item> _data = generateItems(8);

  void _expansionListener(int index, bool isExpanded) {
    setState(() {
      _data[index].isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 400),
      child: SingleChildScrollView(
        child: ExpansionPanelList(
          animationDuration: const Duration(seconds: 1),
          elevation: 0,
          expansionCallback: _expansionListener,
          children: _data.map<ExpansionPanel>((elemenet) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                final TextStyle titleStyle;
                if (isExpanded) {
                  titleStyle =
                      const TextStyle(backgroundColor: Colors.amberAccent);
                } else {
                  titleStyle =
                      const TextStyle(backgroundColor: Colors.blueGrey);
                }
                return ListTile(
                  title: Text(
                    elemenet.title,
                    style: titleStyle,
                  ),
                );
              },
              body: ListTile(
                  title: Text(elemenet.description),
                  subtitle: const Text(
                      'To delete this panel, tap the trash can icon'),
                  trailing: const Icon(Icons.delete),
                  onTap: () {
                    setState(() {
                      _data.removeWhere(
                          (Item currentItem) => elemenet == currentItem);
                    });
                  }),
              isExpanded: elemenet.isExpanded,
            );
          }).toList(),
        ),
      ),
    );
  }
}
