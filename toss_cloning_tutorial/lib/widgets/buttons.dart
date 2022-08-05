


import 'package:flutter/material.dart';
import 'package:toss_cloning_tutorial/theme/app_colors.dart';
import 'package:toss_cloning_tutorial/theme/text_theme.dart';

class TransferButton extends StatefulWidget {
  const TransferButton({Key? key}) : super(key: key);

  @override
  State<TransferButton> createState() => _TransferButtonState();
}

class _TransferButtonState extends State<TransferButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(AppColors.homeBackground),
      ),
      child: Text(
        '송금',
        style: AppTextStyles.button1.copyWith(color: AppColors.textPrimary),
      ),
    );
  }
}

class HistoryButton extends StatefulWidget {
  const HistoryButton({Key? key}) : super(key: key);

  @override
  State<HistoryButton> createState() => _HistoryButtonState();
}

class _HistoryButtonState extends State<HistoryButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(AppColors.homeBackground),
      ),
      child: Text(
        '내역',
        style: AppTextStyles.button1.copyWith(color: AppColors.textPrimary),
      ),
    );
  }
}
