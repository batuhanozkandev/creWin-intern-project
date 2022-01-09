import 'package:crewin_intern_project/core/constants/color/authMainPageColors.dart';
import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  final bool isSelectedSignIn;
  final Function onPressSignIn, onPressSignUp;

  const TopBar(
      {Key? key,
      required this.onPressSignIn,
      required this.onPressSignUp,
      required this.isSelectedSignIn})
      : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        height: height * 0.07,
        width: width * 0.5,
        decoration: BoxDecoration(
            color: kTopBarBackgroundColor,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => widget.onPressSignIn,
              child: Container(
                height: height * 0.06,
                width: width * 0.25,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: widget.isSelectedSignIn
                            ? Colors.blueGrey
                            : kTopBarBackgroundColor),
                    borderRadius: BorderRadius.circular(10),
                    color: widget.isSelectedSignIn
                        ? Colors.white
                        : kTopBarBackgroundColor),
                child: Center(
                    child: Text(
                  "SignIn",
                  style: TextStyle(
                      color: widget.isSelectedSignIn ? Colors.black : kInActiveColor,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            GestureDetector(
              onTap: () => widget.onPressSignUp,
              child: Container(
                height: height * 0.06,
                width: width * 0.25,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: widget.isSelectedSignIn
                            ? kTopBarBackgroundColor
                            : Colors.blueGrey),
                    borderRadius: BorderRadius.circular(10),
                    color: widget.isSelectedSignIn
                        ? kTopBarBackgroundColor
                        : Colors.white),
                child: Center(
                    child: Text(
                  "SignUp",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: widget.isSelectedSignIn ? kInActiveColor : Colors.black,
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
