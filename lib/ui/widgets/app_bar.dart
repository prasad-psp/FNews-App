import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool visibleNewsLogoWithTitle;

  MyAppBar({this.title = "", required this.visibleNewsLogoWithTitle, super.key});

  @override
  Widget build(BuildContext context) {
    if(visibleNewsLogoWithTitle) {
      return AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 0),
          child: Center(
            child: Image.asset(
              "assets/images/newspaper.png",
              width: 20,
              height: 20,
            ),
          ),
        ),
        title: Text(title),
        titleSpacing: 0,
        elevation: 0.0,
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
      );
    }

    return AppBar(
      title: Text(title),
      titleSpacing: 0,
      elevation: 0.0,
      backgroundColor: Colors.black,
      foregroundColor: Colors.amber,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
