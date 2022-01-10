import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CwBackArrow extends StatelessWidget {
  const CwBackArrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: FaIcon(FontAwesomeIcons.arrowLeft)));
  }
}
