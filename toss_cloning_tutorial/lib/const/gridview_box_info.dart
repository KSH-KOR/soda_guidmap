import 'package:flutter/material.dart';

class GridViewBoxInfo {
  final String bankName;
  final Image bankIcon;

  GridViewBoxInfo({required this.bankName, required this.bankIcon});
}

final List<GridViewBoxInfo> bankList = [
  GridViewBoxInfo(bankName: 'NH농협', bankIcon: Image.asset('assets/images/grid/BankIconGrid1.png')),
  GridViewBoxInfo(bankName: 'KB국민', bankIcon: Image.asset('assets/images/grid/BankIconGrid2.png')),
  GridViewBoxInfo(bankName: '카카오뱅크', bankIcon: Image.asset('assets/images/grid/BankIconGrid3.png')),
  GridViewBoxInfo(bankName: '신한', bankIcon: Image.asset('assets/images/grid/BankIconGrid4.png')),
  GridViewBoxInfo(bankName: '우리', bankIcon: Image.asset('assets/images/grid/BankIconGrid5.png')),
  GridViewBoxInfo(bankName: 'IBK기업', bankIcon: Image.asset('assets/images/grid/BankIconGrid6.png')),
  GridViewBoxInfo(bankName: '하나', bankIcon: Image.asset('assets/images/grid/BankIconGrid7.png')),
  GridViewBoxInfo(bankName: '새마을', bankIcon: Image.asset('assets/images/grid/BankIconGrid8.png')),
  GridViewBoxInfo(bankName: '대구', bankIcon: Image.asset('assets/images/grid/BankIconGrid9.png')),
  GridViewBoxInfo(bankName: '부산', bankIcon: Image.asset('assets/images/grid/BankIconGrid10.png')),
  GridViewBoxInfo(bankName: '케이뱅크', bankIcon: Image.asset('assets/images/grid/BankIconGrid11.png')),
];

final List<GridViewBoxInfo> scList = [
  GridViewBoxInfo(bankName: 'NH투자', bankIcon: Image.asset('assets/images/grid/SC1.png')),
  GridViewBoxInfo(bankName: '한국투자', bankIcon: Image.asset('assets/images/grid/SC2.png')),
  GridViewBoxInfo(bankName: '신한금융투자', bankIcon: Image.asset('assets/images/grid/SC3.png')),
  GridViewBoxInfo(bankName: '하나금융', bankIcon: Image.asset('assets/images/grid/SC4.png')),
  GridViewBoxInfo(bankName: '키움', bankIcon: Image.asset('assets/images/grid/SC5.png')),
  GridViewBoxInfo(bankName: '미래에셋', bankIcon: Image.asset('assets/images/grid/SC6.png')),
  GridViewBoxInfo(bankName: 'KB국민', bankIcon: Image.asset('assets/images/grid/SC7.png')),
  GridViewBoxInfo(bankName: '카카오페이증권', bankIcon: Image.asset('assets/images/grid/SC8.png')),
  GridViewBoxInfo(bankName: '대신', bankIcon: Image.asset('assets/images/grid/SC9.png')),
];