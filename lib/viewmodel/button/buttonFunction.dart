import 'package:crewin_intern_project/view/authantication/mainAuth.dart';
import 'package:crewin_intern_project/view/landing/landingPage.dart';
import 'package:flutter/material.dart';

class CwButtonFunc {
  static continueWithEmail(BuildContext context) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainAuth()));
  }

  static continueWithGoogle(BuildContext context) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainAuth()));
  }

  static continueWithFacebook(BuildContext context) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainAuth()));
  }

  static continueWithAnonim(BuildContext context) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainAuth()));
  }
}
