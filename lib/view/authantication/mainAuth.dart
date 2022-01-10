import 'package:crewin_intern_project/core/constants/color/authMainPageColors.dart';
import 'package:crewin_intern_project/model/widget/authMainTopBar.dart';
import 'package:crewin_intern_project/view/authantication/signInPage/signInPage.dart';
import 'package:crewin_intern_project/view/authantication/signUpPage/signUpPage.dart';
import 'package:crewin_intern_project/widget/cwInputBox.dart';
import 'package:crewin_intern_project/widget/cwSizedBox.dart';
import 'package:flutter/material.dart';

PageController _pageController = PageController();

bool _isSelectedSignIn = true;


class MainAuth extends StatefulWidget {
  const MainAuth({Key? key}) : super(key: key);

  @override
  _MainAuthState createState() => _MainAuthState();
}

class _MainAuthState extends State<MainAuth> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Center(
          child: SizedBox(
            width: width * 0.8,
            child: Column(
              children: [
                CwSizedBox(
                  h: 0.1,
                ),
                topBar(height, width),
                CwSizedBox(
                  h: 0.06,
                ),
                SizedBox(
                  width: width,
                  height: height * 0.65,
                  child: PageView(
                    controller: _pageController,
                    children: [SignInPage(), SignUpPage()],
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }

  Center topBar(double height, double width) {
    return Center(
      child: Container(
        height: height * 0.07,
        width: width * 0.8,
        decoration: BoxDecoration(
            color: kTopBarBackgroundColor,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            signInTab(height, width),
            signUpTab(height, width),
          ],
        ),
      ),
    );
  }

  GestureDetector signInTab(double height, double width) {
    return GestureDetector(
      onTap: _onPressTabButton,
      child: Container(
        height: height * 0.06,
        width: width * 0.4,
        decoration: BoxDecoration(
            border: Border.all(
                color: _isSelectedSignIn
                    ? Colors.blueGrey
                    : kTopBarBackgroundColor),
            borderRadius: BorderRadius.circular(15),
            color: _isSelectedSignIn ? Colors.white : kTopBarBackgroundColor),
        child: Center(
            child: Text(
          "SignIn",
          style: TextStyle(
              color: _isSelectedSignIn ? Colors.black : kInActiveColor,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }

  GestureDetector signUpTab(double height, double width) {
    return GestureDetector(
      onTap: _onPressTabButton,
      child: Container(
        height: height * 0.06,
        width: width * 0.4,
        decoration: BoxDecoration(
            border: Border.all(
                color: _isSelectedSignIn
                    ? kTopBarBackgroundColor
                    : Colors.blueGrey),
            borderRadius: BorderRadius.circular(15),
            color: _isSelectedSignIn ? kTopBarBackgroundColor : Colors.white),
        child: Center(
            child: Text(
          "SignUp",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: _isSelectedSignIn ? kInActiveColor : Colors.black,
          ),
        )),
      ),
    );
  }

  void _onPressTabButton() {
    setState(() {
      _isSelectedSignIn = !_isSelectedSignIn;
      _isSelectedSignIn
          ? _pageController.animateToPage(0,
              curve: Curves.ease, duration: Duration(milliseconds: 500))
          : _pageController.animateToPage(1,
              curve: Curves.ease, duration: Duration(milliseconds: 500));
    });
  }
}
