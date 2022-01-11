import 'package:crewin_intern_project/service/sharedPreferences/sharedPreferences.dart';
import 'package:crewin_intern_project/view/authantication/signInPage/signInPage.dart';
import 'package:crewin_intern_project/viewmodel/button/buttonFunction.dart';
import 'package:flutter/material.dart';

class CwYourNameButton extends StatelessWidget {
  final String userName;
  final Widget navigateTo;
  const CwYourNameButton(
      {Key? key, required this.navigateTo, required this.userName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        CwSharedPreferences.setString(key: "userName", value: userName);
        CwButtonFunc.onContinue(context, page: navigateTo);
      },
      child: Container(
        height: height * 0.075,
        width: width * 0.8,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            "Continue",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
