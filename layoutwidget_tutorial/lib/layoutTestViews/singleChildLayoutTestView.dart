import 'package:flutter/material.dart';

class SingleLayoutTest extends StatefulWidget {
  const SingleLayoutTest({Key? key}) : super(key: key);

  @override
  State<SingleLayoutTest> createState() => _SingleLayoutTestState();
}

class _SingleLayoutTestState extends State<SingleLayoutTest> {
  final test = SingleChildLayoutTest();
  final _suggestions = <String, Widget?>{};
  @override
  Widget build(BuildContext context) {
    _suggestions.addAll({
      'align test': test.alignTest(),
      'aspect ratio test': test.alignTest(),
      'constrained box test': test.alignTest(),
      'container box test': test.alignTest(),
    });

    return Scaffold(
      appBar: AppBar(title: const Text('data')),
      body: ListView(
        children: [
          const Text('single child layout test'),
          ListTile(
            leading: const Text('align test'),
            title: test.alignTest(),
          ),
          ListTile(
            leading: const Text('aspect ratio test'),
            title: test.aspectRatioTest(),
          ),
          ListTile(
            leading: const Text('constrained box test'),
            title: test.constrainedBoxTest(),
          ),
          ListTile(
            leading: const Text('container test'),
            title: test.containerTest(),
          ),
          ListTile(
            leading: const Text('Padding test'),
            title: test.paddingTest(),
          ),
          ListTile(
            leading: const Text('Sized Box test'),
            title: test.sizedBoxTest(),
          ),
          ListTile(
            leading: const Text('Stack test'),
            title: test.stackTest(),
          ),
        ],
      ),
    );
  }
}

class SingleChildLayoutTest {
  //Align will let you place widgets in a defined area of its parent widget
  Align alignTest() {
    return const Align(
      //alignment: Alignment.bottomCenter, //use getter of Alignment class to specify the location
      alignment: Alignment(0,
          0), // you can also use a coordinate in range (1, -1) for height and width
      child: Text('I am here!'),
    );
  }

  // you can make any widget in desireable ratio bettwen width and height
  Container aspectRatioTest() {
    return Container(
      color: Colors.green,
      alignment: Alignment.center,
      width: double.infinity,
      height: 100.0,
      child: AspectRatio(aspectRatio: 16 / 9, child: justABox()),
    );
  }

  // how can you make sure or predict where your test will be located?
  // you can set a baseline for the text. your text will be displayed on your baseline.
  // Widget baseLineTest(){
  //   return Baseline(baseline: baseline, baselineType: baselineType);
  // }

  // you can tweak the widths and heights fo widgets to best match your design with ConstrainedBox class
  // you ca specify the maximum and minimum width and height of its child widget
  // for example you can contrained size of text and have it have multiple lines
  Widget constrainedBoxTest() {
    return ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 200,
          maxWidth: 100,
        ),
        child: const Text(
          'This is a multiple line with a font',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 40,
          ),
        ));
  }

  // if your widget style is boring then try wrap it with container widget
  // it helps you compose, decorate, and position child widgets
  Widget containerTest() {
    return Container(
      // color: background color of Constainer widget
      //        but if you use decoration property then you should specify the color there
      // padding: gives some space between the childs and the boundary of Container
      // margin: give empty space around the Container widget
      // decoration: you can add a shape the Container widget
      // alignment: you can align the Container widget using alignment,
      //            if you use this property then the widget will expand the same size to its parent widget's size
      //            but you can override the size specifying Container's width and height
      // constrains: you can use BoxConstrain to resize it
      // trainsform: you can apply transfroms to the widget such as rotating
      //
      /* color: Colors.blue[100], */
      padding: const EdgeInsets.all(35),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue[100],
      ),
      alignment: Alignment.center,
      width: 200,
      height: 200,

      child: const Text(
        'This is wrapped by container widget',
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget paddingTest() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            justABox(height: 100, width: 50),
            justABox(height: 100, width: 50),
            justABox(height: 100, width: 50),
          ],
        ),
        Container(
          alignment: Alignment.center,
          constraints: const BoxConstraints(maxHeight: 120, maxWidth: 210),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: justABox(height: 100, width: 50),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: justABox(height: 100, width: 50),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: justABox(height: 100, width: 50),
              ),
            ],
          ),
        ),
        Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.red)),
            alignment: Alignment.center,
            width: 100,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: justABox(height: 100, width: 100),
            )),
        Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.red)),
            alignment: Alignment.center,
            width: 100,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: justABox(height: 80, width: 80),
            )),
        Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.red)),
            alignment: Alignment.center,
            width: 100,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: justABox(height: 60, width: 60),
            ))
      ],
    );
  }

  Widget sizedBoxTest() {
    return Column(
      children: [
        Container(
          width: 100,
          height: 400,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 98,
                height: 100,
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: justABox(width: 1, height: 1),
                ),
              ),
              Container(
                width: 98,
                height: 100,
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                child: const SizedBox.expand(),
              ),
              Container(
                width: 98,
                height: 100,
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                child: SizedBox(
                  child: justABox(width: 40, height: 40),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget stackTest() {
    return Column(
      children: [
        Stack(
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            Container(
              width: 90,
              height: 90,
              color: Colors.green,
            ),
            Container(
              width: 80,
              height: 80,
              color: Colors.blue,
            ),
          ],
        ),
        SizedBox(
          width: 250,
          height: 250,
          child: Stack(
            children: <Widget>[
              Container(
                width: 250,
                height: 250,
                color: Colors.white,
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Colors.black.withAlpha(0),
                      Colors.black12,
                      Colors.black45
                    ],
                  ),
                ),
                child: const Text(
                  'Foreground Text',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 250,
          height: 250,
          alignment: Alignment.topCenter,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              justABox(color: Colors.red),
              justABox(color: Colors.yellow),
              justABox(color: Colors.green),
              justABox(),
            ],
          ),
        )
      ],
    );
  }

  Widget justABox({double? width, double? height, Color? color}) => Container(
        width: width ?? 50.0,
        height: height ?? 50.0,
        decoration: BoxDecoration(
          color: color ?? Colors.blue,
          border: Border.all(),
        ),
      );
}
