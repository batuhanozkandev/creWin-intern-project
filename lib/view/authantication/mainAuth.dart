import 'package:crewin_intern_project/core/constants/color/authMainPageColors.dart';
import 'package:crewin_intern_project/model/widget/authMainTopBar.dart';
import 'package:crewin_intern_project/widget/cwInputBox.dart';
import 'package:crewin_intern_project/widget/cwSizedBox.dart';
import 'package:flutter/material.dart';

PageController _pageController = PageController();

bool _isSelectedSignIn = true;

String userEmail = "";
String userPassword = "";
String userPasswordRetry = "";

String signUpuserEmail = "";
String signUpuserPassword = "";
String signUpuserPasswordRetry = "";

class MainAuth extends StatefulWidget {
  const MainAuth({Key? key}) : super(key: key);

  @override
  _MainAuthState createState() => _MainAuthState();
}

class _MainAuthState extends State<MainAuth> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Center(
          child: SizedBox(
            width: width * 0.5,
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
                    children: [
                      signInSection(height, width),
                      signUpSection(height, width),
                    ],
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }

  Column signUpSection(double height, double width) {
    return Column(
                      children: [
                        cwInputBox(
                          height,
                          width,
                          onChange: (String value) =>
                              _onChange(value, userInfo: signUpuserEmail),
                          keyboardType: TextInputType.emailAddress,
                          header: "Email",
                          errorMessage: 'Invalid Email',
                        ),
                        CwSizedBox(
                          h: 0.03,
                        ),
                        cwInputBox(height, width,
                            onChange: (String value) =>
                                _onChange(value, userInfo: signUpuserPassword),
                            keyboardType: TextInputType.visiblePassword,
                            header: "Password",
                            isObscureText: true,
                            errorMessage: 'Invalid Password'),
                        CwSizedBox(
                          h: 0.03,
                        ),
                        cwInputBox(height, width,
                            onChange: (String value) =>
                                _onChange(value, userInfo: signUpuserPassword),
                            keyboardType: TextInputType.visiblePassword,
                            header: "Re-write Password",
                            isObscureText: true,
                            errorMessage: ''),
                        CwSizedBox(
                          h: 0.06,
                        ),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                                children: [
                                  TextSpan(
                                      text:
                                          "Lorem ipsum dolor sit amet lit, sed d "),
                                  TextSpan(
                                      text: "Term of Use",
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.underline,
                                          color: Colors.blue)),
                                  TextSpan(
                                      text:
                                          " labore magna aliqua. aliqua. o eiusmod tempor incididunt ut "),
                                  TextSpan(
                                      text: "Privacy Notice",
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.underline,
                                          color: Colors.blue)),
                                  TextSpan(text: " labore et dolore "),
                                ])),
                        Spacer(),
                        Container(
                          height: height * 0.075,
                          width: width * 0.5,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "Continue",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    );
  }

  Column signInSection(double height, double width) {
    return Column(
      children: [
        cwInputBox(
          height,
          width,
          onChange: (String value) => _onChange(value, userInfo: userEmail),
          keyboardType: TextInputType.emailAddress,
          header: "Email",
          errorMessage: 'Invalid Email',
        ),
        CwSizedBox(
          h: 0.03,
        ),
        cwInputBox(height, width,
            onChange: (String value) =>
                _onChange(value, userInfo: userPassword),
            keyboardType: TextInputType.visiblePassword,
            header: "Password",
            isObscureText: true,
            errorMessage: 'Invalid Password'),
        CwSizedBox(
          h: 0.03,
        ),
        Text(
          "Forgat Password?",
          style: TextStyle(
              color: Colors.grey, decoration: TextDecoration.underline),
        ),
        Spacer(),
        Container(
          height: height * 0.075,
          width: width * 0.5,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              "Continue",
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  Column cwInputBox(double height, double width,
      {void Function(String)? onChange,
      required TextInputType keyboardType,
      required String header,
      required String errorMessage,
      bool? isObscureText}) {
    return Column(
      children: [
        Align(alignment: Alignment.centerLeft, child: Text(header)),
        CwSizedBox(
          h: 0.015,
        ),
        Container(
          height: height * 0.07,
          width: width * 0.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.withOpacity(0.5))),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                child: TextFormField(
                  obscureText: isObscureText ?? false,
                  keyboardType: keyboardType,
                  validator: (value) {
                    if ((!(value!.contains("@") &&
                            (value.contains(".com") ||
                                value.contains(".co")))) ||
                        value.length < 8) {
                      return errorMessage;
                    }
                  },
                  onChanged: onChange,
                  decoration: InputDecoration(
                      isCollapsed: true, border: InputBorder.none),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Center topBar(double height, double width) {
    return Center(
      child: Container(
        height: height * 0.07,
        width: width * 0.5,
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
        width: width * 0.25,
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
        width: width * 0.25,
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

  void _onChange(String value, {required String userInfo}) {
    setState(() {
      userInfo = value;
      print(userInfo);
    });
  }
}
