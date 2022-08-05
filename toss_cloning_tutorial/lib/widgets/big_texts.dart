import 'package:flutter/cupertino.dart';

class BigText extends StatelessWidget {
  BigText({
    Key? key,
    required this.text,
    this.color = const Color(0xFF332d2b),
    this.overFlow = TextOverflow.ellipsis,
    this.size = 20,
    this.height = 20,
  }) : super(key: key);

  final Color color;
  final String text;
  double size;
  double height;
  TextOverflow overFlow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
        color: color,
        fontSize: size,
      ),
    );
  }
}