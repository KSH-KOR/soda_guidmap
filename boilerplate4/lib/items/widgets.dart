import 'package:boilerplate4/utils/helper_widgets.dart';
import 'package:flutter/material.dart';

import '../constants/enum.dart';
import '../theme/text_theme_constants.dart';
import '../theme/theme_constants.dart';



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

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({Key? key}) : super(key: key);

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

class MyRadio extends StatefulWidget {
  const MyRadio({Key? key}) : super(key: key);
  @override
  State<MyRadio> createState() => _MyRadioState();
}

class _MyRadioState extends State<MyRadio> {
  Gender? _gender = Gender.male;
  void _listener(Gender? value) {
    setState(() {
      _gender = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        
        MaterialState.selected,
      };
      if (states.any(interactiveStates.contains)) {
        return colorButton;
      }
      return Colors.grey;
    }
    return SizedBox(
      width: 280,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: Gender.values.map<Widget>((enumElement) {
          return Expanded(
            child: ListTile(
              contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              horizontalTitleGap: 0,
              title: Text(enumElement.name.capitalize(), style: Theme.of(context).primaryTextTheme.subtitle2!.copyWith(color: Colors.black, letterSpacing: 1.99),),
              leading: Radio<Gender>(
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: enumElement,
                groupValue: _gender,
                onChanged: _listener,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

extension StringExtension on String {
    String capitalize() {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    }
}

class MyTextField extends StatefulWidget {
  const MyTextField({Key? key}) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {

  late final TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: TextField(
            controller: _textEditingController,
            style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(decoration: TextDecoration.none, color: Colors.black),

            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              border: const OutlineInputBorder(),
              labelStyle: Theme.of(context).primaryTextTheme.subtitle1,
              hintText: 'Name',
              labelText: 'Name',
            ),
          ),
        );
    
    
  }
}

class MyCheckOptions extends StatelessWidget {
  const MyCheckOptions({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Row(
        children: Job.values.map<Widget>((enumElement) {
          return SizedBox(
            width:140,
            child: ListTile(
              contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              horizontalTitleGap: 0,
              leading: const MyCheckBox(),
              title: Text(
                enumElement.name.capitalize(),
                style: Theme.of(context)
                    .primaryTextTheme
                    .subtitle2!
                    .copyWith(color: Colors.black, letterSpacing: 1.99),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class MyCheckBox extends StatefulWidget {
  const MyCheckBox({Key? key}) : super(key: key);

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.selected,
      };
      if (states.any(interactiveStates.contains)) {
        return colorButton;
      }
      return Colors.grey;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

Future<void> showMyDialog(BuildContext context, String text){
  return showDialog(
    context: context, 
    builder: (context) {
      return AlertDialog(
        content: Text(text, style: Theme.of(context).primaryTextTheme.subtitle2!.copyWith(
                        color: const Color.fromRGBO(0, 0, 0, 0.6),
                        letterSpacing: 1.25,
                      ),),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            }, 
            child: Text("확인", style: Theme.of(context).primaryTextTheme.subtitle2!.copyWith(
                        color: const Color.fromRGBO(75, 110, 177, 1),
                        letterSpacing: 1.25,
                      ),))
        ],
      );
    },);
}

class MySwitch extends StatefulWidget {
  const MySwitch({Key? key}) : super(key: key);

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool isSwitched = false;

  void showSnackBar(newVal){
    if(newVal) ScaffoldMessenger.of(context).showSnackBar(getMySnackBar(null, null));
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitched,
      onChanged: (newVal) {
        setState(() {
          isSwitched = newVal;
          showSnackBar(newVal);
        });
      },
      activeTrackColor: const Color.fromRGBO(75, 110, 177, 1),
      activeColor: Colors.white,
    );
  }
}

SnackBar getMySnackBar(String? label, String? text){
  return SnackBar(
    action: SnackBarAction(
      label: label ?? 'OK',
      textColor: const Color.fromRGBO(249, 153, 153, 1),
      onPressed: () {
        // Code to execute.
      },
    ),
    content: Text(text ?? 'switch를 ON 하였습니다.'),
    duration: const Duration(milliseconds: 3000),
    backgroundColor: const Color.fromRGBO(57, 57, 57, 1),
    behavior: SnackBarBehavior.fixed,
  );
}

String convertDateTimeToText(DateTime? dateTime){
  DateTime selectedDate = dateTime ?? DateTime.now();
  return 'Selected: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
}

Future<DateTime?> getDateTime(BuildContext context) async {
  
  Future<DateTime?> dateTime = showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2001),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget? child) {
        return child!;
      });

  return dateTime;
}

class OutlinedCardChild extends StatelessWidget {
  const OutlinedCardChild({Key? key, this.title, this.bodyText}) : super(key: key);

  final String? title;
  final String? bodyText;

  final String defaultTitle = 'Boilerplate 4';
  final String defaultBodyText = 
  """
  어느덧 SODA 캠프 8일차가 되었네요!
  여기까지 달려오시느라 수고 많으셨어요 :)

  아래 있는 CANCEL과 SUBMIT은 버튼입니다 !!
  """;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 1, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? defaultTitle,
            style: Theme.of(context).primaryTextTheme.headline6?.copyWith(color: Colors.black),
          ),
          addVerticalSpace(20),
          Text(
            bodyText ?? defaultBodyText,
            style: Theme.of(context).primaryTextTheme.bodyText2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {},
              ),
              TextButton(
                child: const Text('SUBMIT'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OutlinedCard extends StatelessWidget {
  const OutlinedCard({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            width: 1.0,
            color: colorBorder,
          ),
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        child: child,
      ),
    );
  }
}

class MyChoiceChips extends StatefulWidget {
  const MyChoiceChips({Key? key}) : super(key: key);

  @override
  State<MyChoiceChips> createState() => _MyChoiceChipsState();
}

class _MyChoiceChipsState extends State<MyChoiceChips> {
  late List<String> _choices;
  late int _choiceIndex;

  @override
  void initState() {
    _choiceIndex = 0;
    _choices = ["SODA", "CAMP", "FUN", "FLUTTER"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _choices.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: ChoiceChip(
              label: Text(_choices[index]),
              selected: _choiceIndex == index,
              onSelected: (bool selected) {
                setState(() {
                  _choiceIndex = selected ? index : 0;
                });
              },
              
              labelStyle: _choiceIndex == index ? Theme.of(context).primaryTextTheme.subtitle2?.copyWith(color: Colors.white) : null,
            ),
          );
        },
      ),
    );
  }
}

