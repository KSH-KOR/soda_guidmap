import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  SmallText({
    Key? key,
    required this.text,
    this.color =  const Color.fromARGB(255, 110, 97, 92),
    this.overFlow = TextOverflow.ellipsis,
    this.size = 15,
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
        fontWeight: FontWeight.w300,
        color: color,
        fontSize: size,
      ),
    );
  }
}