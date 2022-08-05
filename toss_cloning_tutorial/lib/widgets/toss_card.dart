


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toss_cloning_tutorial/theme/app_colors.dart';
import 'package:toss_cloning_tutorial/theme/text_theme.dart';
import 'dart:developer' show log;

extension Log on String{
  void printLog(){
    return log(this);
  }
}

class TossCardInfo {
  final Image bankIcon;
  final String bankName;
  int balance;
  final Widget? button;

  TossCardInfo({
    required this.bankIcon,
    required this.bankName,
    this.balance = 0,
    this.button,
  });

  String convertCurrencyFormat() => NumberFormat.currency(locale: "ko_KR", symbol: "").format(balance).toString();

  String getBalance() => "${convertCurrencyFormat()} 원";
}

class TossCard extends StatelessWidget {
  const TossCard({Key? key, required this.myAsset}) : super(key: key);
  final TossCardInfo myAsset;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      horizontalTitleGap: 0,
      minLeadingWidth: 50,
      leading: myAsset.bankIcon,
      title: InkWell(
        onTap: () {
          'Clicked'.printLog();
        },
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 30),
          color: AppColors.cardBackground,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                myAsset.bankName,
                style: AppTextStyles.body3,
              ),
              Text(
                myAsset.getBalance(),
                style: AppTextStyles.body1,
              ),
            ],
          ),
        ),
      ),
      trailing: myAsset.button,
    );
  }
}
