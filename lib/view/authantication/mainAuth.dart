import 'package:crewin_intern_project/model/widget/authMainTopBar.dart';
import 'package:crewin_intern_project/widget/cwSizedBox.dart';
import 'package:flutter/material.dart';


class MainAuth extends StatefulWidget {
  const MainAuth({Key? key}) : super(key: key);

  @override
  _MainAuthState createState() => _MainAuthState();
}

class _MainAuthState extends State<MainAuth> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [
            CwSizedBox(
              h: 0.12,
            ),
            TopBar(),
          ],
        )),
      ),
    );
  }
}
