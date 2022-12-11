import 'package:flutter/material.dart';
import 'ext.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() {
    return _homeState();
  }
}

class _homeState extends State<home> {

  @override
  Widget build(BuildContext context) {
    return ScrollContainer(
      context: context,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
            child: ImageIcon(
              const AssetImage('assets/icons/GM_white.png'),
              color: Colors.white,
              size: MediaQuery.of(context).size.shortestSide / 3,
            ),
          )
        ],
      )
    );
  }
}