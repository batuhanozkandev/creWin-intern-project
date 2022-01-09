import 'package:crewin_intern_project/widget/cwSizedBox.dart';
import 'package:flutter/material.dart';

String signUpuserEmail = "";
String signUpuserPassword = "";
String signUpuserPasswordRetry = "";

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
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
                  TextSpan(text: "Lorem ipsum dolor sit amet lit, sed d "),
                  TextSpan(
                      text: "Term of Use",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue)),
                  TextSpan(
                      text:
                          " labore magna aliqua. aliqua. o eiusmod tempor incididunt ut "),
                  TextSpan(
                      text: "Privacy Notice",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue)),
                  TextSpan(text: " labore et dolore "),
                ])),
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

  void _onChange(String value, {required String userInfo}) {
    setState(() {
      userInfo = value;
      print(userInfo);
    });
  }
}
