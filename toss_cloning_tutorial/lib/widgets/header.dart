import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toss_cloning_tutorial/theme/app_colors.dart';
import 'package:toss_cloning_tutorial/theme/text_theme.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Text(
        text,
        style: AppTextStyles.mediumTitle.copyWith(color: AppColors.textBlackHead),
      ),
    );
  }
}
