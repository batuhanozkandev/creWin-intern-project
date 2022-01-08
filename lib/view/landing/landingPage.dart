import 'package:crewin_intern_project/core/constants/color/landingPageColors.dart';
import 'package:crewin_intern_project/model/widget/logo.dart';
import 'package:crewin_intern_project/viewmodel/button/buttonFunction.dart';
import 'package:crewin_intern_project/widget/cwLandingButton.dart';
import 'package:crewin_intern_project/widget/cwSizedBox.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          CwSizedBox(
            h: 0.1,
          ),
          LandingButton(
            buttonColor: Colors.green,
            onPress: () => CwButtonFunc.continueWithEmail(context),
            text: 'Continue with email',
            icon: Icon(
              Icons.email,
              color: Colors.white,
            ),
          ),
          CwSizedBox(
            h: 0.03,
          ),
          LandingButton(
            buttonColor: Colors.red,
            onPress: () => CwButtonFunc.continueWithGoogle(context),
            text: 'Continue with Google',
            icon: FaIcon(
              FontAwesomeIcons.google,
              color: Colors.white,
            ),
          ),
          CwSizedBox(
            h: 0.03,
          ),
          LandingButton(
            buttonColor: Colors.blue,
            onPress: () => CwButtonFunc.continueWithFacebook(context),
            text: 'Continue with Facebook',
            icon: Icon(
              Icons.facebook,
              color: Colors.white,
            ),
          ),
          CwSizedBox(
            h: 0.03,
          ),
          GestureDetector(
            onTap: ()=>CwButtonFunc.continueWithAnonim(context),
            child: Text(
              "without signing",
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      )),
    );
  }
}
