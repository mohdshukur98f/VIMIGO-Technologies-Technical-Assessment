import 'package:candidate_technical_assessment/home.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Page 1',
          body: 'Page 1',
          // image: ('assets/.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Page 1',
          body: 'Page 1',
          // image: buildImage('assets/.png'),
          // decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Page 1',
          body: 'Page 1',
          // image: buildImage('assets/.png'),
          // decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Page 1',
          body: 'Page 1',
          // image: buildImage(' .png'),
          // decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Page 1',
          body: 'Page 1',
          // image: buildImage('.png'),
          // decoration: getPageDecoration(),
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
        MaterialPageRoute(builder: (_) => const Home()),
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
