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

int selectedWeight = _scrollController.initialItem;
List weightList = [];

class WeightPage extends StatefulWidget {
  const WeightPage({Key? key}) : super(key: key);

  @override
  _WeightPageState createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  @override
  void initState() {
    for (int i = 40; i < 220; i++) {
      weightList.add(i);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.initialItem = (weightList.length / 2).ceil();
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
                text: "How much is your weight?",
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
        itemCount: weightList.length,
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
              selectedWeight = weightList[index];
            });
          },
          childDelegate: ListWheelChildBuilderDelegate(
            builder: (context, index) => Text(
              weightList[index].toString(),
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            childCount: weightList.length,
          ),
        ),
      ),
    );
  }
}
