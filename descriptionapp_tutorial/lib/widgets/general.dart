import 'package:flutter/material.dart';

class TitleSection extends StatefulWidget {
  const TitleSection({Key? key}) : super(key: key);

  @override
  State<TitleSection> createState() => _TitleSectionState();
}

class _TitleSectionState extends State<TitleSection> {
  int _favoriteCount = 41;
  bool _isFavorited = true;

  void handleChanges(bool newState) {
    setState(() {
      if (!newState) {
        _favoriteCount--;
      } else {
        _favoriteCount++;
      }
      _isFavorited = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          FavoriteWidget(
            favoriteCount: _favoriteCount,
            isFavorited: _isFavorited,
            onChanged: handleChanges,
          ),
        ],
      ),
    );
  }
}

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget(
      {Key? key,
      required this.isFavorited,
      required this.favoriteCount,
      required this.onChanged})
      : super(key: key);

  final bool isFavorited;
  final int favoriteCount;
  final ValueChanged<bool> onChanged;

  void _handleTap(){
    onChanged(!isFavorited);
  }

  @override
  Widget build(BuildContext context) {
    Widget favoriteWidget = IconButton(
      onPressed: _handleTap,
      icon: const Icon(Icons.star),
      color: isFavorited ? Colors.red : Colors.black45,
    );

    return Row(
      children: [
        favoriteWidget,
        Text(favoriteCount.toString()),
      ],
    );
  }
}

Widget textSection = const Padding(
  padding: EdgeInsets.all(32),
  child: Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
    'Alps. Situated 1,578 meters above sea level, it is one of the '
    'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
    'half-hour walk through pastures and pine forest, leads you to the '
    'lake, which warms to 20 degrees Celsius in the summer. Activities '
    'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,
  ),
);

Widget buttonSection(BuildContext context) {
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  Color color = Theme.of(context).primaryColor;

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildButtonColumn(color, Icons.call, 'CALL'),
      _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
      _buildButtonColumn(color, Icons.share, 'SHARE'),
    ],
  );
}
