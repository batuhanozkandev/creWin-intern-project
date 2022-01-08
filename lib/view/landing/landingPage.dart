import 'package:crewin_intern_project/core/constants/color/landingPageColors.dart';
import 'package:crewin_intern_project/model/widget/logo.dart';
import 'package:crewin_intern_project/widget/cwSizedBox.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: SingleChildScrollView(
          child: Column(
        children: [
          CwSizedBox(
            h: 0.2,
          ),
          CwLogo(imagePath: "logo.jpg"),
          Text(kdesctiptionText, style: kdescriptionTextStyle),
          
        ],
      )),
    );
  }
}
