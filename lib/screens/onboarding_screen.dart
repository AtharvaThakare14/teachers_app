import 'package:teachers_app/constants.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:teachers_app/screens/auth_pages/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _headstyle = const TextStyle(
      color: Color(0xff475467),
      fontSize: 20,
      height: 1.3,
      fontWeight: FontWeight.bold);
  final _subHeadStyle = const TextStyle(
      color: Color(0xff98A2B3),
      height: 1.2,
      fontSize: 12,
      fontWeight: FontWeight.bold);

  final _pageController = PageController();
  var _currentPage = 0;

  @override
  Widget build(BuildContext pageContext) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: _currentPage < 2
                  ? TextButton(
                      onPressed: () {
                        setState(() {
                          _pageController.jumpToPage(2);
                          _currentPage = 2;
                        });
                      },
                      child: const Text(
                        "Skip",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff475467)),
                      ),
                    )
                  : const SizedBox(height: 48),
            ),
            Flexible(
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                controller: _pageController,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Lottie.asset("assets/onboarding/potrait-1.json"),
                        Text("Everything you\n need at one place",
                            textAlign: TextAlign.center, style: _headstyle),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                            "Pass your next exam with least amount\n of time, effort and money spent",
                            textAlign: TextAlign.center,
                            style: _subHeadStyle)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Lottie.asset("assets/onboarding/potrait-2.json"),
                        Text("Improve your Mark &\n Rank with Mock Tests",
                            textAlign: TextAlign.center, style: _headstyle),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                            "Get test for all topics with mock test\n to be exam ready",
                            textAlign: TextAlign.center,
                            style: _subHeadStyle)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Lottie.asset("assets/onboarding/potrait-3.json"),
                        Text("Get Personalized\n analysis",
                            textAlign: TextAlign.center, style: _headstyle),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                            "Deep analytics and personalized\ninsights just for you",
                            textAlign: TextAlign.center,
                            style: _subHeadStyle)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: _currentPage < 2
                  ? Row(
                      children: [
                        _currentPage > 0
                            ? MaterialButton(
                                height: 50,
                                minWidth: 60,
                                elevation: 0,
                                child: const Text(
                                  "Prev",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff475467),
                                  ),
                                ),
                                onPressed: () {
                                  _pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 600),
                                      curve: Curves.linear);
                                })
                            : const SizedBox(),
                        const Spacer(),
                        MaterialButton(
                            height: 50,
                            minWidth: 140,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            color: kPrimaryColor,
                            elevation: 0,
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Next",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    //fontFamily: 'poppins',
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.white,
                                  size: 18,
                                )
                              ],
                            ),
                            onPressed: () {
                              _pageController.nextPage(
                                  duration: const Duration(milliseconds: 600),
                                  curve: Curves.linear);
                            }),
                      ],
                    )
                  : MaterialButton(
                      height: 50,
                      minWidth: 140,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      color: kPrimaryColor,
                      elevation: 0,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Get Started",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.white,
                            size: 18,
                          )
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return
                                  // ChangeNotifierProvider.value(
                                  //     value:
                                  //         Provider.of<AuthController>(pageContext),
                                  //     child:
                                  LoginScreen()
                                  //  )
                                  ;
                            },
                          ),
                        );
                      }),
            ),
          ],
        ),
      ),
    );
  }
}
