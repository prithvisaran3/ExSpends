import 'package:expense/app/ui/widget/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../controllers/auth.dart';
import '../theme/colors.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoarding> {
  final int numPages = 3;
  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  List<Widget> buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < numPages; i++) {
      list.add(i == currentPage ? indicator(true) : indicator(false));
    }
    return list;
  }

  void onIntroEnd() {
    AuthController.to.setOnBoardDataAfterScreenCompleted();
  }

  Widget indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : Colors.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => onIntroEnd(),
                child: Container(
                  height: media.width * 0.08,
                  width: media.width * 0.15,
                  margin: const EdgeInsets.only(right: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    // color: Color(0xFF7B51D3)
                  ),
                  alignment: Alignment.centerRight,
                  child: const Center(
                    child: CommonText(
                      text: 'Skip',
                      fontColor: AppColors.primary,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: media.height * 0.8,
                child: PageView(
                  physics: const ClampingScrollPhysics(),
                  controller: pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      currentPage = page;
                    });
                  },
                  children: [
                    buildSlider(
                        title: "Welcome",
                        content: "Onboard with us get more earnings",
                        image: "otp"),
                    buildSlider(
                        title: "Get more commission",
                        content:
                            "You will get more commission compare to other providers",
                        image: "otp"),
                    buildSlider(
                        title: "Verified & Assured Trips",
                        content:
                            "All the trips are verified and confirmed trips for the admin",
                        image: "otp"),
                  ],
                ),
              ),
              // SizedBox(
              //   height: media.width * 0.1,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: buildPageIndicator(),
              ),
              currentPage != numPages - 1
                  ? Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomRight,
                        child: InkWell(
                          onTap: () {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: Container(
                            height: 40,
                            // width: media.width * 0.25,
                            padding: const EdgeInsets.only(
                                top: 10.0, bottom: 10, right: 25, left: 25),
                            margin: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: AppColors.primary),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text(
                                  'Next',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 22.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  :
              const SizedBox(),
              currentPage == numPages - 1
                  ? GestureDetector(
                onTap: () => onIntroEnd(),
                child: Container(
                  height: media.width * 0.10,
                  margin: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.primary,
                  ),
                  child:  Center(
                    child: Text(
                      'Get started',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
                  : const SizedBox(),
            ],
          ),
        ),
      ),

    );
  }

  Column buildSlider({required title, required content, required image}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: buildSvgPicture(imgSrc: image)),
        CommonText(
          text: title,
          textAlign: TextAlign.center,
          fontSize: 24, fontWeight: FontWeight.bold,fontColor: AppColors.primary,
        ),
        const SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: CommonText(
            text: content,
            textAlign: TextAlign.center,
           fontSize: 18,fontColor: AppColors.primary,
          ),
        )
      ],
    );
  }

  SvgPicture buildSvgPicture({required imgSrc}) {
    return SvgPicture.asset(
      "assets/images/$imgSrc.svg",
      height: 300,
    );
  }
}
