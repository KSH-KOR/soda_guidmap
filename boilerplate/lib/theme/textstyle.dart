import 'package:flutter/material.dart';

const headLineFont = TextStyle(
  fontFamily: 'Roboto',
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  fontSize: 20,
  color: Colors.white,
);
const drawerFont = TextStyle(
  fontFamily: 'Roboto',
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  fontSize: 14,
  color: Color.fromRGBO(123, 122, 122, 1),
);
const labelFont = TextStyle(
  fontFamily: 'Roboto',
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 12,
  color: Color.fromRGBO(151, 151, 151, 1),
);
const navigationBarLabelFont = TextStyle(
  fontFamily: 'Roboto',
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 12,
  color: Color.fromRGBO(151, 151, 151, 1),
  height: 16,
  letterSpacing: 0.4,
  inherit: true,
);
const substitle2 = TextStyle(
            fontFamily: 'Roboto',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Color.fromRGBO(0, 0, 0, 0.6),
          );

const bottomNavigationBarThemeData = BottomNavigationBarThemeData(
  type: BottomNavigationBarType.fixed,
  showUnselectedLabels: true,
  selectedItemColor:Color.fromRGBO(75, 110, 177, 1),
  unselectedIconTheme: IconThemeData(color: Color.fromRGBO(151, 151, 151, 1),),
);