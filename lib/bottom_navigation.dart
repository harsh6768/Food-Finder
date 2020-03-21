import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 50.0,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Icon(Icons.home),
          ),
          Expanded(
            flex: 1,
            child: LayoutBuilder(builder: (context, constraint) {
              return Icon(
                Icons.navigation,
                size: constraint.biggest.height,
                color: Colors.red,
              );
            }),
          ),
          Expanded(
            flex: 1,
            child: Icon(Icons.account_circle),
          )
        ],
      ),
    );
  }
}
