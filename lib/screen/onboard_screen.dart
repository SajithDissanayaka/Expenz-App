import 'package:expenz_app/constance/colors.dart';
import 'package:expenz_app/data/OnBoarding_data.dart';
import 'package:expenz_app/screen/onboarding/front_page.dart';
import 'package:expenz_app/screen/onboarding/shared_onboarding_screen.dart';
import 'package:expenz_app/screen/user_Data_screen.dart';
import 'package:expenz_app/widget/custome_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardScreen extends StatefulWidget {

  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {

  // page controller

  PageController _controller = PageController();

  //show details page
  bool showDetailsPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // dashboard screens 
                PageView( // horizontal scroll 
                  controller: _controller,
                  onPageChanged: (index){
                    setState(() {
                      showDetailsPage = index == 3;
                      print("showDetailsPage");
                    });
                  },
                  children: [
                    FrontPage(),
                    SharedOnboardingScreen(
                      title: OnBoardingData.onboardingdatalist[0].title, 
                      imagePath: OnBoardingData.onboardingdatalist[0].imagePath, 
                      description: OnBoardingData.onboardingdatalist[0].description,
                      ),

                     SharedOnboardingScreen(
                      title: OnBoardingData.onboardingdatalist[1].title, 
                      imagePath: OnBoardingData.onboardingdatalist[1].imagePath, 
                      description: OnBoardingData.onboardingdatalist[1].description,
                      ),

                     SharedOnboardingScreen(
                      title: OnBoardingData.onboardingdatalist[2].title, 
                      imagePath: OnBoardingData.onboardingdatalist[2].imagePath, 
                      description: OnBoardingData.onboardingdatalist[2].description,
                      ),
                  ],
                ),

                //page . indicators
                Container(
                  alignment: Alignment(0, 0.75),
                  child: SmoothPageIndicator(
                      controller: _controller,
                      
                      count: 4,
                      effect: WormEffect(
                        activeDotColor: kMainColor,
                        dotColor: kGrey,
                      ),
                    ),
                ),
                // navigation button
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child:!showDetailsPage ? GestureDetector(
                      onTap: (){
                        _controller.animateToPage(
                          _controller.page!.toInt() + 1,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                          
                         );
                      },
                      child: CustomeButton(
                        
                        buttonName: showDetailsPage ? "Get Started" : "Next",
                        buttonColor: kMainColor,
                      
                      ),
                    ):

                    GestureDetector(
                      onTap: (){
                       //navigation to userDataDetails
                       Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>  UserDataScreen(),),);
                      },
                      child: CustomeButton(
                        buttonName: showDetailsPage ? "Get Started" : "Next",
                        buttonColor: kMainColor,
                      
                      ),
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