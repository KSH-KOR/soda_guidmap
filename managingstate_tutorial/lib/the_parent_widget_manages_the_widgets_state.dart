import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ParentWidget extends StatefulWidget {
  const ParentWidget({Key? key}) : super(key: key);

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {

  bool _isActive = false;
  void _handleTabBoxState(bool newValue){
    setState(() {
      _isActive = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TapboxB(isActive: _isActive, onChanged: _handleTabBoxState,);
  }
}


//Once TapBoxB is created, it won't be changed
//But it calls the function onChanged which is actually _handleTabBoxState function in its parent, then it triggers setState
//then upon calling setState, framwork got notified the state is changed it builds again.
class TapboxB extends StatelessWidget {
  const TapboxB({Key? key, required this.onChanged, required this.isActive}) : super(key: key);

  final ValueChanged<bool> onChanged; // Signature for callbacks that report that an underlying value has changed.
  final bool isActive;

  void _handleTap(){
    onChanged(!isActive);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        SnackBar snackBar = SnackBar(content: Text(isActive ? 'Active' : 'Inactive'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        _handleTap();
      },
      // The custom button
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isActive? Colors.lightBlue : Colors.black45,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
            isActive ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32.0, color: Colors.white),
          ),
      ),
    );
  }
}