import 'package:flutter/material.dart';
import 'package:toss_cloning_tutorial/const/toss_card_info.dart';
import 'package:toss_cloning_tutorial/const/toss_card_vertical_info.dart';
import 'package:toss_cloning_tutorial/utils/helper_widgets.dart';
import 'package:toss_cloning_tutorial/widgets/bottom_buttons.dart';
import 'package:toss_cloning_tutorial/widgets/horiziontal_scroll_box.dart';
import 'package:toss_cloning_tutorial/widgets/toss_assets_list.dart';
import 'package:toss_cloning_tutorial/widgets/toss_box.dart';
import 'package:toss_cloning_tutorial/widgets/toss_card.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView(
          children: [
            const TossBox(
              height: 75,
              header: TossBoxHeader(title: '토스뱅크'),
            ),
            addVerticalSpace(20),
            TossBox(
              header: const TossBoxHeader(title: '자산'),
              body: const TossAssetsList(),
              tail: TossBoxTail(tail: point),
            ),
            addVerticalSpace(20),
            TossBox(
              header: const TossBoxHeader(title: '소비', hasRightArrowButton: false),
              body: TossCard(myAsset: spending),
              tail: TossBoxTail(tail: cardBill),
            ),
            addVerticalSpace(20),
            TossCardVerticalBox(
                tossCardVerticalItemList: tossCardVerticalItemList),
            addVerticalSpace(20),
            const BottomButtons(
              leftButtonName: '금액 숨기기',
              rightButtonName: '자산 추가',
            ),
            addVerticalSpace(50),

          ],
        ),
      );
      
  }
}
