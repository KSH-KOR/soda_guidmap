import 'package:flutter/material.dart';
import 'dart:developer' show log;

class ParentWidget extends StatefulWidget {
  const ParentWidget({Key? key}) : super(key: key);

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {

  bool _isActive = false;
  void _handleTabBoxState(bool newState){
    setState(() {
      _isActive = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TapboxC(
      isActive: _isActive,
      onChanged: _handleTabBoxState,
    );
  }
}

class TapboxC extends StatefulWidget {
  const TapboxC({Key? key, this.isActive = false, required this.onChanged}) : super(key: key);

  final bool isActive;
  final onChanged;

  @override
  State<TapboxC> createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {

  bool _highlight = false;

  void _handleTapCancel(){
    _highlight = false;
  }
  void _handleTapDown(TapDownDetails details){
    _highlight = false;
  }
  void _handleTapUp(TapUpDetails details){
    _highlight = true;
  }
  void _handleTap(){
    widget.onChanged(!widget.isActive);
  }

  @override
  Widget build(BuildContext context) {
    log(_highlight.toString());
    return GestureDetector(
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: widget.isActive ? Colors.lightBlue : Colors.black45,
          border: _highlight
              ? Border.all(
                  color: Colors.teal[700]!,
                  width: 10.0,
                )
              : null,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          widget.isActive ? 'Active' : 'Inactive',
          style: const TextStyle(fontSize: 32.0, color: Colors.white),
        ),
      ),
    );
    
  }
}