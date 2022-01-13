import 'package:crewin_intern_project/view/gender/genderPage.dart';
import 'package:crewin_intern_project/view/selectionMainPage/selectionMainPage.dart';
import 'package:crewin_intern_project/widget/cwBackArrow.dart';
import 'package:crewin_intern_project/widget/cwContinueButton.dart';
import 'package:crewin_intern_project/widget/cwSizedBox.dart';
import 'package:crewin_intern_project/widget/yourNameButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

String userName = "";

class YourNamePage extends StatefulWidget {
  const YourNamePage({Key? key}) : super(key: key);

  @override
  _YourNamePageState createState() => _YourNamePageState();
}

class _YourNamePageState extends State<YourNamePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: width * 0.8,
            child: Column(
              children: [
                CwSizedBox(h: 0.08),
                CwBackArrow(),
                CwSizedBox(h: 0.2),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Your Name?",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
                  ),
                ),
                CwSizedBox(h: 0.1),
                nameInputBox(height, width),
                CwSizedBox(h: 0.2),
                CwYourNameButton(
                  navigateTo: SelectionMainPage(),
                  userName: userName,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container nameInputBox(double height, double width) {
    return Container(
      height: height * 0.07,
      width: width * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.withOpacity(0.5))),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: TextFormField(
              onChanged: (String value) => _onChangeName(value),
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  isCollapsed: true,
                  border: InputBorder.none,
                  hintText: "Your Name"),
            ),
          ),
        ),
      ),
    );
  }

  void _onChangeName(String value) {
    setState(() {
      userName = value;
      print(userName);
    });
  }
}
