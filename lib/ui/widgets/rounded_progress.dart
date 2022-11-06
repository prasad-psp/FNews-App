import 'package:flutter/material.dart';

class RoundProgressbar extends StatelessWidget {
  final Color color;
  const RoundProgressbar(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: color,
    ));
  }
}
