import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CwBackSlideArrow extends StatelessWidget {
  const CwBackSlideArrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: FaIcon(FontAwesomeIcons.arrowLeft));
  }
}
