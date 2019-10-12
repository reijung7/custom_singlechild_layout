import 'package:flutter/material.dart';

class BasicCustomSingleChildLayout extends StatelessWidget {
  //A widget that defers the layout of its single child to a delegate.
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("CustomSingleChildLayout Widget")),
      body: Container(
        height: 180.0,
        width: 180.0,
        color: Colors.pink[200],
        child: CustomSingleChildLayout(
          delegate: _MySingleChildLayoutDelegate(
            //send the size of the viewport to the delegate for computation
            widgetSize: size,
          ),
        ),
      ),
    );
  }
}

class _MySingleChildLayoutDelegate extends SingleChildLayoutDelegate {
  _MySingleChildLayoutDelegate({@required this.widgetSize});

  final Size widgetSize;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    //we expand the layout to our predefined sizes
    return BoxConstraints.expand(width: 240.0, height: 240.0);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    //we place the widget at the center, by dividing the width and height by 2 to get the center
    return Offset(widgetSize.width / 2, widgetSize.height / 2);
  }

  @override
  bool shouldRelayout(_MySingleChildLayoutDelegate oldDelegate) {
    return widgetSize != oldDelegate.widgetSize;
  }
}