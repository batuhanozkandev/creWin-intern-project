import 'package:crewin_intern_project/widget/cwSizedBox.dart';
import 'package:flutter/material.dart';

class LandingButton extends StatefulWidget {
  final String text;
  final Widget? icon;
  final Color buttonColor;
  final VoidCallback onPress;
  const LandingButton(
      {Key? key,
      required this.text,
      this.icon,
      required this.buttonColor,
      required this.onPress})
      : super(key: key);

  @override
  _LandingButtonState createState() => _LandingButtonState();
}

class _LandingButtonState extends State<LandingButton> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        height: height * 0.08,
        width: width * 0.7,
        decoration: BoxDecoration(
            color: widget.buttonColor, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            CwSizedBox(w: 0.1),
            widget.icon ?? CwSizedBox(w: 0.02),
            CwSizedBox(w: 0.1),
            Text(
              widget.text,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
