
import 'package:flutter/material.dart';

class TapboxA extends StatefulWidget {
  const TapboxA({Key? key}) : super(key: key);

  @override
  State<TapboxA> createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _isActive = false;
  void _toggleActiveState(){
    
    setState(() {
      _isActive = !_isActive;
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
  // When the child is tapped, show a snackbar.
      onTap: () {
        SnackBar snackBar = SnackBar(content: Text(_isActive ? 'Active' : 'Inactive'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        _toggleActiveState();
      },
      // The custom button
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: _isActive? Colors.lightBlue : Colors.black45,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
            _isActive ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32.0, color: Colors.white),
          ),
      ),
    );
  }
}