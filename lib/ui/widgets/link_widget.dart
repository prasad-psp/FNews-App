import 'package:flutter/material.dart';

class LinkWidget extends StatelessWidget {
  final msg;
  const LinkWidget({required this.msg, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 7.0,
        bottom: 7.0,
      ),
      child: Text(
        msg,
        style: TextStyle(color: Colors.blue[700],fontSize: 13.0),
      ),
    );
  }
}
