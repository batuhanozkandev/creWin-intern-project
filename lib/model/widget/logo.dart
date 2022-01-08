import 'package:flutter/material.dart';

class CwLogo extends StatelessWidget {
  final String imagePath;
  const CwLogo({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset("assets/logo/${imagePath}",scale: 1.5,));
  }
}
