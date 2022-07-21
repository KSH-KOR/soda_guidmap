import 'package:flutter/material.dart';
import '../service/description_view_serivce.dart';

class DescriptionView extends StatefulWidget {
  const DescriptionView({Key? key}) : super(key: key);

  @override
  State<DescriptionView> createState() => _DescriptionViewState();
}

class _DescriptionViewState extends State<DescriptionView> {

  final DescriptionViewInfo _service = DescriptionViewInfo(
      'Oeschinen Lake Campground',
      'Kandersteg, Switzerland',
      'description',
      Image.asset('images/lake1.jpg'));
  final _nameFont = const TextStyle(
    fontWeight: FontWeight.bold,
  );
  final _locationFont = TextStyle(
    color: Colors.grey[500],
  );

  bool isFavorited = true;
  int favoriteCount = 41;

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
  
  Widget _textSection() => Padding(
        padding: const EdgeInsets.all(32),
        child: Text(_service.description),
      );

  Widget _leftSide() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                _service.name,
                style: _nameFont,
              )),
          Text(
            _service.location,
            style: _locationFont,
          ),
        ],
      );

  Widget _buttonSection() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(
              Theme.of(context).primaryColor, Icons.call, 'CALL'),
          _buildButtonColumn(
              Theme.of(context).primaryColor, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(
              Theme.of(context).primaryColor, Icons.share, 'SHARE'),
        ],
      );

  @override
  Widget build(BuildContext context) {

    Widget favoriteWidget() {
      void _toggleFavorite() {
        setState(() {
          if (isFavorited) {
            favoriteCount -= 1;
            isFavorited = false;
          } else {
            favoriteCount += 1;
            isFavorited = true;
          }
        });
      }
      
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(0),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              alignment: Alignment.centerRight,
              icon: (isFavorited
                  ? const Icon(Icons.star)
                  : const Icon(Icons.star_border)),
              color: Colors.red[500],
              onPressed: _toggleFavorite,
            ),
          ),
          SizedBox(
            width: 18,
            child: SizedBox(
              child: Text('$favoriteCount'),
            ),
          ),
        ],
      );
    }

    Widget titleSection() {
      Widget leftSide = _leftSide();
      
      return Padding(
        padding: const EdgeInsets.all(32),
        child: Row(
          children: [
            Expanded(
              child: leftSide,
            ),
            favoriteWidget(),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter layout demo'),
      ),
      body: ListView(children: [
        _service.image,
        titleSection(),
        _textSection(),
        _buttonSection(),
      ]),
    );
  }
}
