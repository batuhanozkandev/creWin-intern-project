import 'package:crewin_intern_project/viewmodel/button/buttonFunction.dart';
import 'package:flutter/material.dart';

class CwContinueButton extends StatelessWidget {
  final Widget navigateTo;
  const CwContinueButton({ Key? key, required this.navigateTo }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return  GestureDetector(onTap: () => CwButtonFunc.onContinue(context, page: navigateTo) ,
          child: Container(
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
          ),
        );
  }
}