

import 'package:flutter/material.dart';
import 'package:toss_cloning_tutorial/widgets/buttons.dart';
import 'package:toss_cloning_tutorial/widgets/toss_card.dart';

final List<TossCardInfo> myAssetList = [
  TossCardInfo(
    bankIcon: Image.asset('assets/images/bankIcon1.png'),
    bankName: '토스 뱅크 통장',
    button: const TransferButton(),
    balance: 16735,
  ),
  TossCardInfo(
    bankIcon: Image.asset('assets/images/bankIcon2.png'),
    bankName: '우리뱅크월렛카카오통장\n(저축예금)',
    button: const TransferButton(),
    balance: 74000,
  ),
  TossCardInfo(
    bankIcon: Image.asset('assets/images/bankIcon3.png'),
    bankName: '보통예금(IBK평생한가족통장)',
    button: const TransferButton(),
  ),
  TossCardInfo(
    bankIcon: Image.asset('assets/images/bankIcon4.png'),
    bankName: '입출금통장',
    button: const TransferButton(),
  ),
  TossCardInfo(
    bankIcon: Image.asset('assets/images/bankIcon5.png'),
    bankName: '영하나플러스 통장',
    button: const TransferButton(),
  ),
  TossCardInfo(
    bankIcon: Image.asset('assets/images/bankIcon6.png'),
    bankName: '저축   우리청년희망 적금',
    balance: 2500000,
  ),
];

final point = TossCardInfo(
  bankIcon: Image.asset('assets/images/point1.png'),
  bankName: '포인트 머니',
  balance: 2500000,
);

final spending = TossCardInfo(
  bankIcon: Image.asset('assets/images/spending1.png'),
  bankName: '이번 달 쓴 금액',
  button: const HistoryButton(),
  balance: 467200,
);

final cardBill = TossCardInfo(
  bankIcon: Image.asset('assets/images/cardBill.png'),
  bankName: '7월 13일 낼 카드값',
  balance: 1200,
);
