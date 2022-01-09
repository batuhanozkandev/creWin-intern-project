import 'package:crewin_intern_project/widget/cwSizedBox.dart';
import 'package:flutter/material.dart';

String userEmail = "";
String userPassword = "";
String userPasswordRetry = "";

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(
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
    ));
  }

  void _onChange(String value, {required String userInfo}) {
    setState(() {
      userInfo = value;
      print(userInfo);
    });
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
}
