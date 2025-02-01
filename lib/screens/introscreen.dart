import 'package:flutter/material.dart';
import 'package:islami/model/onboardingmodel.dart';
import 'package:islami/services/storeKeys.dart';
import 'package:islami/services/storeService.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController controlpage = PageController();
  List<OnBoardingModel> pages = OnBoardingModel.pages;
  int rightnowindex = 0;

  void goNext() {
    if (rightnowindex < pages.length - 1) {
      rightnowindex++;
      controlpage.animateToPage(
        rightnowindex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousBoard() {
    if (rightnowindex > 0) {
      rightnowindex--;
      controlpage.animateToPage(
        rightnowindex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  bool finishOnBoard() {
    Navigator.popAndPushNamed(context, 'second');

    return true;
  }

  @override
  Widget build(BuildContext context) {
    var screendim = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Color(0xff202020),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: screendim.height * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/Group 30.png'),
              ),
            ),
          ),
          SizedBox(
            height: screendim.height * 0.63,
            child: PageView.builder(
              controller: controlpage,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(
                  () {
                    rightnowindex = index;
                  },
                );
              },
              itemCount: pages.length,
              itemBuilder: (context, index) {
                return AnimatedSwitcher(
                  duration: Duration(seconds: 1),
                  child: Column(
                    children: [
                      Container(
                        height: screendim.height * 0.4,
                        width: screendim.height * 0.4,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              // images[index],
                              pages[rightnowindex].image,
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      rightnowindex == 0
                          ? Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    pages[rightnowindex].promo,
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Color(0xffE2BE7F),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    pages[rightnowindex].title ?? '',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Color(0xffE2BE7F),
                                    ),
                                  ),
                                  SizedBox(
                                    height: screendim.height * 0.05,
                                  ),
                                  Text(
                                    pages[rightnowindex].promo,
                                    // softWrap: true,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xffE2BE7F),
                                    ),
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                  ),
                                ],
                              ),
                            )
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: rightnowindex == 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Spacer(
                        flex: 2,
                      ),
                      AnimatedSmoothIndicator(
                        activeIndex: rightnowindex,
                        count: pages.length,
                        effect: ExpandingDotsEffect(
                          activeDotColor: Color(0xffE2BE7F),
                          dotColor: Color(0xff707070),
                          dotHeight: 7,
                          dotWidth: 7,
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      TextButton(
                        onPressed: goNext,
                        child: Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xffE2BE7F),
                          ),
                        ),
                      ),
                    ],
                  )
                : rightnowindex < pages.length - 1
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: previousBoard,
                            child: Text(
                              'Back',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xffE2BE7F),
                              ),
                            ),
                          ),
                          AnimatedSmoothIndicator(
                            activeIndex: rightnowindex,
                            count: pages.length,
                            effect: ExpandingDotsEffect(
                              activeDotColor: Color(0xffE2BE7F),
                              dotColor: Color(0xff707070),
                              dotHeight: 7,
                              dotWidth: 7,
                            ),
                          ),
                          TextButton(
                            onPressed: goNext,
                            child: Text(
                              'Next',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xffE2BE7F),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: previousBoard,
                            child: Text(
                              'Back',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xffE2BE7F),
                              ),
                            ),
                          ),
                          AnimatedSmoothIndicator(
                            activeIndex: rightnowindex,
                            count: pages.length,
                            effect: ExpandingDotsEffect(
                              activeDotColor: Color(0xffE2BE7F),
                              dotColor: Color(0xff707070),
                              dotHeight: 7,
                              dotWidth: 7,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              LocalStorageServices.setbool(
                                  LocalStorageKeys.runforthefirsttime, true);
                              Navigator.popAndPushNamed(context, 'second');
                            },
                            child: Text(
                              'Finish',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xffE2BE7F),
                              ),
                            ),
                          ),
                        ],
                      ),
          )
        ],
      ),
    );
  }
}
