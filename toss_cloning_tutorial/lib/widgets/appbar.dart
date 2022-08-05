
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toss_cloning_tutorial/theme/app_colors.dart';
import 'package:toss_cloning_tutorial/utils/helper_widgets.dart';
import 'package:toss_cloning_tutorial/widgets/big_texts.dart';

String getCurrencySymbol(BuildContext context) {
  Locale locale = Localizations.localeOf(context);
  var format =
      NumberFormat.simpleCurrency(locale: locale.toString(), name: 'KRW');
  return format.currencySymbol;
}

class CurrencyIcon extends StatelessWidget {
  const CurrencyIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: 25,
            height: 25,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.topIcon,
            ),
          ),
          Text(
            getCurrencySymbol(context),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class TossAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TossAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.homeBackground,
      elevation: 0,
      leadingWidth: 120,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            const CurrencyIcon(),
            addHorizontalSpace(5),
            BigText(
              text: 'toss',
              color: AppColors.topIcon,
              size: 30,
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.chat_bubble_rounded,
            color: AppColors.topIcon,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications,
            color: AppColors.topIcon,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
