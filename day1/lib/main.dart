import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

void listTest(){
  late final List<int> numbers = [];
  numbers.addAll([
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
  ]);

  int total =
      numbers.fold(
    0,
    (previousValue, element) => previousValue + element,
  );

  numbers.log();
  total.log();
}

void mapTest(){
  String _printTable({required String item, required int price}){
    final text = "item: $item (100g) price: $price";
    return text;
  }
  const priceMap = {
    'Apple' : 5,
    'Strawberry' : 6,
    'melon' : 10,
  };

  final priceTable = priceMap.entries.map((e) => _printTable(item: e.key, price: e.value, ));
  priceTable.toList().log();
}

class Idol{
  late final String name;
  late final String group;

  Idol({
    required this.name,
    required this.group,
  });
  Idol.fromMap({required Map<String, String> nameAndGroup})
      : name = nameAndGroup['name'] as String,
        group = nameAndGroup['group'] as String;
  
  String get getGroup => group;
  String get getName => name;
  String sayName() => "my name is $name in $group group";
}
void classTest1(){
  final nameAndGroup = {
    'name' : 'a',
    'group' : 'redvelvet',
  };
  Idol i = Idol.fromMap(nameAndGroup: nameAndGroup);
  Idol j = Idol(group: 'red', name: 'shinhoo');
  i.sayName().log();
  j.sayName().log();
  i.getName.log();
  j.getName.log();
}
void test(){
  // listTest();
  // mapTest();
  classTest1();
}

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
    test();
    return Scaffold(
      appBar: AppBar(title: const Text('data')),
    );
  }
}
