import 'package:boilerplate3/theme/theme_constants.dart';
import 'package:boilerplate3/utils/helper_widgets.dart';
import 'package:flutter/material.dart';
import 'items/widgets.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: lightTheme,
    home:  const HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DateTime? _selectedDate;

  void _datePickerListner(selectedDate){
    setState(() {
      _selectedDate = selectedDate;
      ScaffoldMessenger.of(context).showSnackBar(getMySnackBar('undo', convertDateTimeToText(_selectedDate)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'SODA'),
      drawer: const MyDrawer(headerTitle: 'SODA'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            
            addVerticalSpace(25),
            Container(
              width: 375,
              alignment: Alignment.center,
              child: const MyTextField(),
            ),
            addVerticalSpace(25),
            const MyRadio(),
            Container(
              width: 375,
              alignment: Alignment.center,
              child: const MyCheckOptions(),
            ),
            addVerticalSpace(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '버튼을 눌러 날짜를 선택해주세요.',
                  style: Theme.of(context).primaryTextTheme.subtitle2!.copyWith(
                        color: Colors.black,
                        letterSpacing: 1.25,
                      ),
                ),
                addHorizontalSpace(10),
                OutlinedButton(
                  onPressed: () async {
                    _datePickerListner(await getDateTime(context));
                    
                  },
                  child: Text(
                    'select Date'.toUpperCase(),
                    style:
                        Theme.of(context).primaryTextTheme.subtitle2!.copyWith(
                              color: const Color.fromRGBO(75, 110, 177, 1),
                              letterSpacing: 1.25,
                            ),
                  ),
                ),
              ],
            ),
          
          ],
        ),
      ),
      floatingActionButton: Container(
        alignment: const Alignment(1, 0.9),
        child: FloatingActionButton(
          onPressed: () async {
            await showMyDialog(context, '+ 버튼을 누르셨습니다.');
          },
          child: const Icon(Icons.add),
          
        ),
      ),
      bottomSheet: const MyBottomSheet() ,
    );
  }
}



