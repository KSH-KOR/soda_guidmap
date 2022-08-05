import 'package:flutter/material.dart';
import 'package:toss_cloning_tutorial/const/gridview_box_info.dart';
import 'package:toss_cloning_tutorial/widgets/gridview_box.dart';
import 'package:toss_cloning_tutorial/widgets/header.dart';
import 'package:toss_cloning_tutorial/widgets/small_texts.dart';



class SendingTab extends StatefulWidget {
  const SendingTab({Key? key}) : super(key: key);

  @override
  State<SendingTab> createState() => _SendingTabState();
}

class _SendingTabState extends State<SendingTab> {
  @override
  Widget build(BuildContext context) {
    

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: ListView(
        children: [
          const Header(text: '어디로 돈을 보낼까요?'),
          GridViewBox(gridViewBoxInfoList: bankList),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 35, 0, 20),
            child: SmallText(text: '증권사 선택', size: 18,),
          ),
          GridViewBox(gridViewBoxInfoList: scList),
        ],
      ),
    );
  }
}
