import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/app_assets.dart';
import 'package:evently_app/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionScreens extends StatefulWidget {
  static const routeName = "introduction screen";

  const IntroductionScreens({super.key});

  @override
  State<IntroductionScreens> createState() => _IntroductionScreensState();
}

class _IntroductionScreensState extends State<IntroductionScreens> {
  @override
  Widget build(BuildContext context) {
    String currentLanguage = context.locale.languageCode;

    List<PageViewModel> listPagesViewModel = [
      PageViewModel(
        titleWidget: Align(
          alignment: currentLanguage == 'en'
              ? Alignment.centerLeft
              : Alignment.centerRight,
          child: Text(
            "intro_title_1".tr(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        bodyWidget: Text(
          "intro_body_1".tr(),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        image: Image.asset(
          AppAssets.introductionImage1,
          width: double.infinity,
          fit: BoxFit.fitHeight,
        ),
        decoration: PageDecoration(
          imagePadding: const EdgeInsets.only(top: 40),
        ),
      ),
      PageViewModel(
        titleWidget: Align(
          alignment: currentLanguage == 'en'
              ? Alignment.centerLeft
              : Alignment.centerRight,
          child: Text(
            "intro_title_2".tr(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        bodyWidget: Text(
          "intro_body_2".tr(),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        image: Image.asset(
          AppAssets.introductionImage2,
          width: double.infinity,
          fit: BoxFit.fitHeight,
        ),
        decoration: PageDecoration(
          imagePadding: const EdgeInsets.only(top: 40),
        ),
      ),
      PageViewModel(
        titleWidget: Align(
          alignment: currentLanguage == 'en'
              ? Alignment.centerLeft
              : Alignment.centerRight,
          child: Text(
            "intro_title_3".tr(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        bodyWidget: Text(
          "intro_body_3".tr(),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        image: Image.asset(
          AppAssets.introductionImage3,
          width: double.infinity,
          fit: BoxFit.fitHeight,
        ),
        decoration: PageDecoration(
          imagePadding: const EdgeInsets.only(top: 40),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AppAssets.topLogo, height: 40),
        centerTitle: true,
      ),
      body: IntroductionScreen(
        pages: listPagesViewModel,
        onDone: () {
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        },
        onSkip: () {
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        },
        showSkipButton: true,
        skip: introductionButton("skip".tr()),
        next: introductionButton("next".tr()),
        done: introductionButton("done".tr()),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Theme.of(context).colorScheme.primary,
          color: Colors.grey,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }

  Container introductionButton(String label) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
