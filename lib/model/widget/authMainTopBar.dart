import 'package:crewin_intern_project/core/constants/color/authMainPageColors.dart';
import 'package:flutter/material.dart';

bool _isSelectedSignIn = true;

class TopBar extends StatefulWidget {
  const TopBar({Key? key}) : super(key: key);

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
              onTap: () {
                setState(() {
                  _isSelectedSignIn = !_isSelectedSignIn;
                });
              },
              child: Container(
                height: height * 0.06,
                width: width * 0.25,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: _isSelectedSignIn
                            ? Colors.blueGrey
                            : kTopBarBackgroundColor),
                    borderRadius: BorderRadius.circular(10),
                    color: _isSelectedSignIn
                        ? Colors.white
                        : kTopBarBackgroundColor),
                child: Center(
                    child: Text(
                  "SignIn",
                  style: TextStyle(
                      color: _isSelectedSignIn ? Colors.black : kInActiveColor,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isSelectedSignIn = !_isSelectedSignIn;
                });
              },
              child: Container(
                height: height * 0.06,
                width: width * 0.25,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: _isSelectedSignIn
                            ? kTopBarBackgroundColor
                            : Colors.blueGrey),
                    borderRadius: BorderRadius.circular(10),
                    color: _isSelectedSignIn
                        ? kTopBarBackgroundColor
                        : Colors.white),
                child: Center(
                    child: Text(
                  "SignUp",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _isSelectedSignIn ? kInActiveColor : Colors.black,
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
