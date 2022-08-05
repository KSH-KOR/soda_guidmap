import 'package:flutter/material.dart';
import 'package:toss_cloning_tutorial/services/navigation_bar/navigation_bar_provider.dart';
import 'package:provider/provider.dart';
import 'package:toss_cloning_tutorial/theme/app_colors.dart';
import 'package:toss_cloning_tutorial/theme/text_theme.dart';

class TossBottomNavigationBar extends StatefulWidget {
  const TossBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<TossBottomNavigationBar> createState() =>
      _TossBottomNavigationBarState();
}

class _TossBottomNavigationBarState extends State<TossBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColors.cardBackground,
          selectedLabelStyle:
              AppTextStyles.appbar.copyWith(color: AppColors.textPrimary),
          unselectedLabelStyle:
              AppTextStyles.appbar.copyWith(color: AppColors.bottomNaviEnable),
          selectedItemColor: AppColors.textPrimary,
          unselectedItemColor: AppColors.bottomNaviEnable,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          currentIndex: provider.currentIndex,
          onTap: (index) {
            provider.currentIndex = index;
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
              ),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.diamond,
              ),
              label: '혜택',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.send,
              ),
              label: '송금',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.show_chart,
              ),
              label: '주식',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
              ),
              label: '전체',
            ),
          ],
        ),
      ),
    );
  }
}
