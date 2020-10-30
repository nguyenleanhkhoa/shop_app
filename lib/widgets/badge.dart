import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  const Badge({
    Key key,
    @required this.child,
    @required this.value,
    this.color,
  }) : super(key: key);

  final Widget child;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          child: Container(
            padding: EdgeInsets.all(3.0),
            // color: Theme.of(context).accentColor,

            constraints: BoxConstraints(
              minWidth: 5,
              minHeight: 5,
            ),
            child: Text(
              value,
              style: TextStyle(color: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
