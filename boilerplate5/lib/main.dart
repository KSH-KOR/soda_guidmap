import 'package:boilerplate5/utils/helper_widgets.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:page_view_indicators/page_view_indicators.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: Scaffold(
        body: MyPageView(),
      ),
    );
  }
}

class MyPageView extends StatefulWidget {
  const MyPageView({Key? key}) : super(key: key);

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  late final PageController _pageController;
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    _pageController = PageController();

    super.initState();
  }

  final List<Widget> _pages = [
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/sodaicon1.png',
        ),
        addVerticalSpace(35),
        const Text(
          'Copyright 2022 SODA All rights reserved.',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Color.fromARGB(25*6, 0, 0, 0),
          ),
        ),
      ],
    ),
    Center(
      child: Image.asset(
        'assets/images/sodaicon2.png',
      ),
    ),
    Center(
      child: Image.asset(
        'assets/images/sodaicon3.png',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: _pages[index],
                );
              },
              onPageChanged: (int index) {
                _currentPageNotifier.value = index;
              }),
        ),
        CirclePageIndicator(
          size: 10.0,
          selectedSize: 10.0,
          dotSpacing: 15,
          dotColor: Colors.grey,
          selectedDotColor: Colors.black,
          itemCount: _pages.length,
          currentPageNotifier: _currentPageNotifier,
        ),
        const SizedBox(height: 30,),
      ],
    );
  }
}
