import 'package:flutter/material.dart';
import 'package:toss_cloning_tutorial/theme/app_colors.dart';
import 'package:toss_cloning_tutorial/theme/text_theme.dart';
import 'package:toss_cloning_tutorial/utils/helper_widgets.dart';
import 'dart:developer' show log;

extension Log on String {
  void printLog() {
    return log(this);
  }
}

class TossCardVerticalInfo {
  final String title;
  final String subtitle;
  final Image? icon;

  TossCardVerticalInfo(
      {required this.title, required this.subtitle, this.icon});
}

class TossCardVerticalBox extends StatefulWidget {
  const TossCardVerticalBox({Key? key, required this.tossCardVerticalItemList})
      : super(key: key);

  final List<TossCardVerticalInfo> tossCardVerticalItemList;

  @override
  State<TossCardVerticalBox> createState() => _TossCardVerticalBoxState();
}

class _TossCardVerticalBoxState extends State<TossCardVerticalBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.tossCardVerticalItemList.length,
        itemBuilder: (context, index) {
          return TossCardvertical(
              tossCardInfo: widget.tossCardVerticalItemList[index]);
        },
        separatorBuilder: (context, index) => addHorizontalSpace(20),
      ),
    );
  }
}

class TossCardvertical extends StatefulWidget {
  const TossCardvertical({Key? key, required this.tossCardInfo})
      : super(key: key);

  final TossCardVerticalInfo tossCardInfo;

  @override
  State<TossCardvertical> createState() => _TossCardverticalState();
}

class _TossCardverticalState extends State<TossCardvertical> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        'Clicked'.printLog();
      },
      child: Stack(
        children: [
          Container(
            width: 127,
            height: 156,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            decoration: const BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          Positioned(
            top: 10,
            left: 20,
            child: SizedBox(
              width: 80,
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  addVerticalSpace(10),
                  Text(
                    widget.tossCardInfo.subtitle,
                    style: AppTextStyles.body3
                        .copyWith(color: AppColors.toastBackground),
                  ),
                  addVerticalSpace(10),
                  Text(
                    widget.tossCardInfo.title,
                    style: AppTextStyles.body1
                        .copyWith(color: AppColors.textPrimary),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 36,
            right: 11,
            child: Container(
              width: 49,
              height: 43,
              margin: const EdgeInsets.only(left: 60),
              child: widget.tossCardInfo.icon,
            ),
          ),
        ],
      ),
    );
  }
}
