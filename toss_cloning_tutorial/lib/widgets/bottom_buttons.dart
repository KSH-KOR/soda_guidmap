import 'package:flutter/material.dart';
import 'package:toss_cloning_tutorial/theme/app_colors.dart';
import 'package:toss_cloning_tutorial/theme/text_theme.dart';

class BottomButtons extends StatefulWidget {
  const BottomButtons({Key? key, required this.leftButtonName, required this.rightButtonName}) : super(key: key);

  final String leftButtonName;
  final String rightButtonName;

  @override
  State<BottomButtons> createState() => _BottomButtonsState();
}

class _BottomButtonsState extends State<BottomButtons> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              widget.leftButtonName,
              style: AppTextStyles.button1.copyWith(color: AppColors.toastBackground),
            ),
          ),
          const VerticalDivider(
            thickness: 2,
            indent: 15,
            endIndent: 15,
            color: AppColors.toastBackground,
            width: 30,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              widget.rightButtonName,
              style: AppTextStyles.button1.copyWith(color: AppColors.toastBackground),
            ),
          ),
        ],
      ),
    );
  }
}
