import 'package:flutter/material.dart';
import 'package:fundee/font_awesome_flutter.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              // color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
