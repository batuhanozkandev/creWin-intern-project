import 'package:crewin_intern_project/core/constants/color/landingPageColors.dart';
import 'package:crewin_intern_project/model/widget/logo.dart';
import 'package:crewin_intern_project/widget/cwBackArrow.dart';
import 'package:crewin_intern_project/widget/cwContinueButton.dart';
import 'package:crewin_intern_project/widget/cwNextButton.dart';
import 'package:crewin_intern_project/widget/cwQuestion.dart';
import 'package:crewin_intern_project/widget/cwSizedBox.dart';
import 'package:flutter/material.dart';
import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:clickable_list_wheel_view/measure_size.dart';

FixedExtentScrollController _scrollController = FixedExtentScrollController();

int selectedLength=_scrollController.initialItem;
List lengthList = [];

class LengthPage extends StatefulWidget {
  const LengthPage({Key? key}) : super(key: key);

  @override
  _LengthPageState createState() => _LengthPageState();
}

class _LengthPageState extends State<LengthPage> {
  @override
  void initState() {
    for (int i = 140; i < 220; i++) {
      lengthList.add(i);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.initialItem = (lengthList.length / 2).ceil();
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
                text: "How much is your length?",
              ),
              CwSizedBox(h: 0.05),
              wheelList(width, height),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox wheelList(double width, double height) {
    return SizedBox(
      width: width,
      height: height * 0.3,
      child: ClickableListWheelScrollView(
        scrollController: _scrollController,
        itemHeight: 50,
        itemCount: lengthList.length,
        onItemTapCallback: (index) {
          print("onItemTapCallback index: $index");
        },
        child: ListWheelScrollView.useDelegate(
          controller: _scrollController,
          itemExtent: 50,
          physics: FixedExtentScrollPhysics(),
          overAndUnderCenterOpacity: 0.5,
          perspective: 0.002,
          onSelectedItemChanged: (index) {
            print("onSelectedItemChanged index: $index");
            setState(() {
              selectedLength=lengthList[index];
            });
          },
          childDelegate: ListWheelChildBuilderDelegate(
            builder: (context, index) => Text(
              lengthList[index].toString(),
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            childCount: lengthList.length,
          ),
        ),
      ),
    );
  }
}
