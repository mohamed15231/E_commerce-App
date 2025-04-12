import 'package:flutter/material.dart';
import 'package:shop_app/models/onboarding_model.dart';
import 'package:shop_app/style/color.dart';
import 'package:shop_app/shared/network/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/component/constant.dart';
import '../../shared/component/shared widget.dart';
import '../../shared/component/widgets/onboarding_widgets.dart';
import '../login_screen/screens/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    List<OnBoarding_Model> onBoardingList = [
      OnBoarding_Model(
        image: "assets/shopping-online-onboarding-app-screens-vector.jpg",
        title: "OnBoarding title 1",
        body: "OnBoarding body 1",
      ),
      OnBoarding_Model(
        image: "assets/shopping-online-onboarding-app-screens-vector.jpg",
        title: "OnBoarding title 2",
        body: "OnBoarding body 2",
      ),
      OnBoarding_Model(
        image: "assets/shopping-online-onboarding-app-screens-vector.jpg",
        title: "OnBoarding title 3",
        body: "OnBoarding body 3",
      ),
    ];

    PageController pageController = PageController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [

              Align(
                alignment: AlignmentDirectional.topEnd,

                child: defaultTextButton(text: "Skip", onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                  CacheHelper.setData(value: true, key: onboarding);

                }

                ),
              ),
              Expanded(
                child: PageView.builder(
                  itemCount: onBoardingList.length,
                  onPageChanged: (index) {
                    if (index == onBoardingList.length - 1) {
                      setState(() {});
                      isLast = true;
                    } else {
                      setState(() {});
                      isLast = false;
                    }
                  },
                  controller: pageController,
                  itemBuilder: (context, index) {
                    return pageViewOnBoarding(
                      onboardingModel: onBoardingList[index],
                    );
                  },
                ),
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      dotWidth: 10,
                      dotHeight: 10,
                      strokeWidth: 15,
                      activeDotColor: primary_color,
                    ),
                  ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (isLast == true) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),

                        ).then((value) {
                          CacheHelper.setData(value: true, key: onboarding);

                        },);
                      } else {
                        pageController.nextPage(
                          duration: Duration(milliseconds: 1000),
                          curve: Curves.fastEaseInToSlowEaseOut,
                        );
                      }
                    },
                    shape: CircleBorder(),

                    child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
