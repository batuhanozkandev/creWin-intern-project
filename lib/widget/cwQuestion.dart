import 'package:flutter/material.dart';

class cwQuestion extends StatelessWidget {
  final String text;
  const cwQuestion({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
    );
  }
}
