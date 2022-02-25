import 'package:flutter/material.dart';

class LevelDrawer extends StatelessWidget {
  const LevelDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Color"),
            Text("Language"),
          ],
        ),
      ),
    );
  }
}