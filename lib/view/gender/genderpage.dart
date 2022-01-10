import 'package:crewin_intern_project/core/constants/color/landingPageColors.dart';
import 'package:crewin_intern_project/model/widget/logo.dart';
import 'package:crewin_intern_project/widget/cwBackArrow.dart';
import 'package:crewin_intern_project/widget/cwContinueButton.dart';
import 'package:crewin_intern_project/widget/cwNextButton.dart';
import 'package:crewin_intern_project/widget/cwQuestion.dart';
import 'package:crewin_intern_project/widget/cwSizedBox.dart';
import 'package:flutter/material.dart';

bool isSelectedWoman = false;
bool isSelectedMen = false;

class GenderPage extends StatefulWidget {
  const GenderPage({Key? key}) : super(key: key);

  @override
  _GenderPageState createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: Center(
        child: SizedBox(
          width: width * 0.8,
          child: Column(
            children: [
              cwQuestion(
                text: "What is your sex?",
              ),
              CwSizedBox(h: 0.2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  womanGenderBox(
                      imagePath: 'assets/icons/woman.png',
                      onPress: () {
                        setState(() {
                          isSelectedWoman = !isSelectedWoman;
                          isSelectedMen = false;
                        });
                      },
                      subTitle: 'Woman'),
                  menGenderBox(
                      imagePath: 'assets/icons/man.png',
                      onPress: () {
                        setState(() {
                          isSelectedMen = !isSelectedMen;
                          isSelectedWoman = false;
                        });
                      },
                      subTitle: 'Men'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column menGenderBox(
      {required VoidCallback onPress,
      required String imagePath,
      required String subTitle}) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPress,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 5)
            ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                imagePath,
                color: isSelectedMen ? Colors.black : Colors.grey,
              ),
            ),
          ),
        ),
        CwSizedBox(
          h: 0.02,
        ),
        Text(
          subTitle,
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }

  Column womanGenderBox(
      {required VoidCallback onPress,
      required String imagePath,
      required String subTitle}) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPress,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 5)
            ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                imagePath,
                color: isSelectedWoman ? Colors.pink : Colors.grey,
              ),
            ),
          ),
        ),
        CwSizedBox(
          h: 0.02,
        ),
        Text(
          subTitle,
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
