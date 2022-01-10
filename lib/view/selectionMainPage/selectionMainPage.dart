import 'package:crewin_intern_project/core/constants/color/landingPageColors.dart';
import 'package:crewin_intern_project/model/widget/logo.dart';
import 'package:crewin_intern_project/service/firebase/cwFirebase.dart';
import 'package:crewin_intern_project/view/age/agePage.dart';
import 'package:crewin_intern_project/view/gender/genderPage.dart';
import 'package:crewin_intern_project/view/length/lengthPage.dart';
import 'package:crewin_intern_project/view/weight/weightPage.dart';
import 'package:crewin_intern_project/viewmodel/cwAddInfo.dart';
import 'package:crewin_intern_project/widget/cwBackArrow.dart';
import 'package:crewin_intern_project/widget/cwBackSlideArrow.dart';
import 'package:crewin_intern_project/widget/cwFinishButton.dart';
import 'package:crewin_intern_project/widget/cwNextButton.dart';
import 'package:crewin_intern_project/widget/cwSizedBox.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

PageController pageController = PageController();

int currentPageIndex = 0;
bool isFinished = false;

class SelectionMainPage extends StatefulWidget {
  const SelectionMainPage({Key? key}) : super(key: key);

  @override
  _SelectionMainPageState createState() => _SelectionMainPageState();
}

class _SelectionMainPageState extends State<SelectionMainPage> {
  @override
  void initState() {
    currentPageIndex = 0;
    super.initState();
  }

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
              CwSizedBox(h: 0.07),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          if (currentPageIndex == 0) {
                            Navigator.pop(context);
                          } else {
                            currentPageIndex--;
                            _changePage();
                            print(currentPageIndex);
                          }
                        });
                      },
                      child: CwBackSlideArrow()),
                  CwSizedBox(
                    w: 0.15,
                  ),
                  CwLogo(imagePath: "logo.jpg")
                ],
              ),
              CwSizedBox(h: 0.07),
              SizedBox(
                width: width,
                height: height * 0.5,
                child: PageView(
                  onPageChanged: (index) {
                    currentPageIndex = index;
                    print(currentPageIndex);
                    _changePage();
                  },
                  controller: pageController,
                  children: [
                    GenderPage(),
                    AgePage(),
                    LengthPage(),
                    WeightPage(),
                  ],
                ),
              ),
              currentPageIndex != 3
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          if (currentPageIndex < 3) {
                            currentPageIndex++;
                            print(currentPageIndex);
                            _changePage();
                          }
                        });
                      },
                      child: CwNextButton())
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          isFinished = true;
                        });
                      },
                      child: isFinished ? CwAddandGiveInfo() : CwFinishButton()),
              CwSizedBox(h: 0.04),
              SmoothPageIndicator(
                  controller: pageController, // PageController
                  count: 4,
                  effect: SlideEffect(
                    spacing: 8.0,
                    radius: 10.0,
                    dotWidth: 10.0,
                    dotHeight: 10.0,
                    paintStyle: PaintingStyle.fill,
                    strokeWidth: 1.5,
                    dotColor: Colors.grey.shade300,
                    activeDotColor: Colors.grey.shade600,
                  ), // your preferred effect
                  onDotClicked: (index) {
                    currentPageIndex = index;
                    print(currentPageIndex);
                    _changePage();
                  })
            ],
          ),
        ),
      ),
    );
  }

  void _changePage() {
    setState(() {
      pageController.animateToPage(currentPageIndex,
          curve: Curves.ease, duration: Duration(milliseconds: 500));
      isFinished = false;
    });
  }
}
