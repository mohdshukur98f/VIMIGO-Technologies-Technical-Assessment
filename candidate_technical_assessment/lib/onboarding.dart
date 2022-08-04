import 'package:candidate_technical_assessment/home.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late double screenHeight, screenWidth;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Welcome to Candidate Technical Assessment!',
          body: 'The man who never reads lives only one.',
          image: Image.asset(
            'assets/images/vimigo-logo.png',
            width: screenWidth,
            height: screenHeight,
          ),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Home Page & Sprite Sheet',
          body:
              'This page was displaying the sortable contact list that provided in the Assessment. The application will display an animation using sprite sheet.',
          image: Image.asset(
            'assets/images/p1.png',
            width: screenWidth,
            height: screenHeight,
          ),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Contact Details!',
          body:
              'User able to to click the particular contact to see the details of the contact.',
          image: Image.asset(
            'assets/images/p2.png',
            width: screenWidth,
            height: screenHeight,
          ),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Add New Contact!',
          body: 'User able to add new contact information into the Application',
          image: Image.asset(
            'assets/images/p3.png',
            width: screenWidth,
            height: screenHeight,
          ),
          decoration: getPageDecoration(),
        ),
      ],
      done:
          const Text('Continue', style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: () => goToHome(context),
      showSkipButton: true,
      skip: const Text('Skip'),
      onSkip: () => goToHome(context),
      next: const Icon(Icons.arrow_forward),
      dotsDecorator: getDotDecoration(),
      onChange: (index) => ('Page $index selected'),
      // globalBackgroundColor: Theme.of(context).primaryColor,
      nextFlex: 0,
    ));
  }

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => Home()),
      );

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Colors.grey,

        //activeColor: Colors.orange,
        size: const Size(9, 9),
        activeSize: const Size(20, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
