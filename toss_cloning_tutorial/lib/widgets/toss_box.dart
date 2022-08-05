import 'package:flutter/material.dart';
import 'package:toss_cloning_tutorial/theme/app_colors.dart';
import 'package:toss_cloning_tutorial/theme/text_theme.dart';
import 'package:toss_cloning_tutorial/utils/helper_widgets.dart';
import 'package:toss_cloning_tutorial/widgets/toss_card.dart';

class TossBox extends StatelessWidget {
  const TossBox(
      {Key? key, required this.header, this.height, this.body, this.tail})
      : super(key: key);

  final Widget header;
  final Widget? body;
  final Widget? tail;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: height,
      decoration: const BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          addVerticalSpace(19),
          header,
          body ?? Container(),
          tail ?? Container(),
          addVerticalSpace(19),
        ],
      ),
    );
  }
}

class TossBoxTail extends StatefulWidget {
  const TossBoxTail({Key? key, required this.tail}) : super(key: key);

  final TossCardInfo tail;

  @override
  State<TossBoxTail> createState() => _TossBoxTailState();
}

class _TossBoxTailState extends State<TossBoxTail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: AppColors.homeBackground,
          thickness: 2,
          endIndent: 25,
          indent: 25,
        ),
        TossCard(
          myAsset: widget.tail,
        ),
      ],
    );
  }
}

class TossBoxHeader extends StatefulWidget {
  const TossBoxHeader(
      {Key? key, required this.title, this.hasRightArrowButton = true})
      : super(key: key);

  final String title;
  final bool hasRightArrowButton;

  @override
  State<TossBoxHeader> createState() => _TossBoxHeaderState();
}

class _TossBoxHeaderState extends State<TossBoxHeader> {
  Color backgroundColor = AppColors.cardBackground;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        'Clicked'.printLog();
      },
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: AppTextStyles.mediumTitle,
            ),
            widget.hasRightArrowButton
                ? const Icon(
                    Icons.keyboard_arrow_right,
                    color: AppColors.topIcon,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
