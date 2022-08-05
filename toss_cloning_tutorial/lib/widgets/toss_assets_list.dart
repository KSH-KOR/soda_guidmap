
import 'package:flutter/material.dart';
import 'package:toss_cloning_tutorial/const/toss_card_info.dart';
import 'package:toss_cloning_tutorial/widgets/toss_card.dart';

class TossAssetsList extends StatefulWidget {
  const TossAssetsList({Key? key}) : super(key: key);

  @override
  State<TossAssetsList> createState() => _TossAssetsListState();
}

class _TossAssetsListState extends State<TossAssetsList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: myAssetList
          .map<Widget>(
            (element) => TossCard(myAsset: element),
          )
          .toList(),
    );
    /*
    return ListView.builder(
      itemCount: myAssetList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final myAsset = myAssetList[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
          leading: myAsset.bankIcon,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(myAsset.bankName), Text(myAsset.getBalance())],
          ),
          trailing: myAsset.isTransferable ? const TransferButton() : null,
        );
      },
    );
    */
  }
}
