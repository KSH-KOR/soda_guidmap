import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toss_cloning_tutorial/services/navigation_bar/navigation_bar_provider.dart';
import 'package:toss_cloning_tutorial/tabs/home_tab.dart';
import 'package:toss_cloning_tutorial/tabs/sending_tab.dart';
import 'package:toss_cloning_tutorial/theme/app_colors.dart';
import 'package:toss_cloning_tutorial/widgets/appbar.dart';
import 'package:toss_cloning_tutorial/widgets/bottom_navigation_bar.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {

  var currentTab = [
    const HomeTab(),
    const SendingTab(),
    const SendingTab(),
    const SendingTab(),
    const SendingTab(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);

    return Scaffold(
      appBar: provider.currentIndex == 0 ? const TossAppBar() : null,
      body: currentTab[provider.currentIndex],
      backgroundColor: provider.currentIndex == 0 ?AppColors.homeBackground : Colors.white,
      bottomNavigationBar: const TossBottomNavigationBar(),
    );
  }
}
