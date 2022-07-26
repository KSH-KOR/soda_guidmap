import 'package:flutter/material.dart';

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
      appBar: AppBar(title: const Text('courses'),),
      body: const Center(child: SelectedCourse()),
    );
  }
}

class SelectedCourse extends StatefulWidget {
  const SelectedCourse({Key? key}) : super(key: key);

  @override
  State<SelectedCourse> createState() => _SelectedCourseState();
}

class _SelectedCourseState extends State<SelectedCourse> {
  String? course;

  void _listener(String? newVal) {
    setState(() {
      course = newVal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(course ?? 'not choosen yet'),
        TextButton(
          child: const Text('choose courses'),
          onPressed: () async {
            switch (await showSimpleDialog(context)) {
              case Course.general:
                _listener(null);
                break;
              case Course.linearAlgebra:
                _listener('Linear Algebra');
                break;
              case Course.descreteMath:
                _listener('Descrete Math');
                break;
              case Course.english:
              _listener('English');
              break;
              default:
                break;
            }
          },
        ),
      ],
    );
  }
}

enum Course{
  general,
  linearAlgebra,
  english,
  descreteMath,
  logicDesign,
}

Future<Course?> showSimpleDialog(BuildContext context){
  return showDialog<Course>(context: context, builder: (BuildContext context){
    return SimpleDialog(
      title: const Text('Select assignment'),
      children: 
        Course.values.map(
            (course) {
              return SimpleDialogOption(
                child: Text(course.toString().split('.')[1]),
                onPressed: () {
                  Navigator.of(context).pop(course);
                },
              );
            },
          ).toList(),
        
    );
  }).then((value) => value ?? Course.general);
}