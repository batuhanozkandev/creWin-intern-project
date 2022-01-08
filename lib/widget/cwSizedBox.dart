import 'package:flutter/material.dart';

class CwSizedBox extends StatelessWidget {
  final double? h;
  final double? w;
  const CwSizedBox({Key? key, this.h, this.w}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;

    return SizedBox(
      height:h != null ? h! * height:0,
      width: w != null ? w! * width : 0,
    );
  }
}
