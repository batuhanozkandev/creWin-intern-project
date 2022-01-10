import 'package:crewin_intern_project/viewmodel/button/buttonFunction.dart';
import 'package:flutter/material.dart';

class CwNextButton extends StatelessWidget {
  const CwNextButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.075,
      width: width * 0.8,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          "Next",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
