import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/app_assets.dart';
import 'package:evently_app/core/provider/theme_provider.dart';
import 'package:evently_app/screens/on_boarding_screen/introduction_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatefulWidget {
  static const routeName = "on boarding screen";

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<ThemeProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    String currentLanguage = context.locale.languageCode;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.03,
          vertical: height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: height * 0.01),
            Align(
              alignment: Alignment.center,
              child: Image.asset(AppAssets.topLogo),
            ),
            Image.asset(
              AppAssets.onBoardingImage,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            Text(
              "onBoardingTitle".tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              "onBoardingBody".tr(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "language".tr(),
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Row(
                  spacing: width * 0.02,
                  children: [
                    InkWell(
                      onTap: () {
                        context.setLocale(const Locale('en'));
                      },
                      child: currentLanguage == 'en'
                          ? selectedLanguage("english".tr())
                          : unSelectedLanguage("english".tr()),
                    ),
                    InkWell(
                      onTap: () {
                        context.setLocale(const Locale('ar'));
                      },
                      child: currentLanguage == 'ar'
                          ? selectedLanguage("arabic".tr())
                          : unSelectedLanguage("arabic".tr()),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "theme".tr(),
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Row(
                  spacing: width * 0.02,
                  children: [
                    InkWell(
                      onTap: () {
                        myProvider.changeThemeMode(ThemeMode.light);
                      },
                      child: !myProvider.isDark()
                          ? selectedThemeIcon(AppAssets.sun)
                          : unselectedThemeIcon(AppAssets.sun),
                    ),
                    InkWell(
                      onTap: () {
                        myProvider.changeThemeMode(ThemeMode.dark);
                      },
                      child: myProvider.isDark()
                          ? selectedThemeIcon(AppAssets.moon)
                          : unselectedThemeIcon(AppAssets.moon),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    IntroductionScreens.routeName,
                  );
                },
                child: Text(
                  "lets_start".tr(),
                  // style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container selectedLanguage(String language) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        language,
        style: Theme.of(
          context,
        ).textTheme.titleSmall?.copyWith(color: Colors.white),
      ),
    );
  }

  Container unSelectedLanguage(String language) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).colorScheme.primary),
      ),
      child: Text(language, style: Theme.of(context).textTheme.titleSmall),
    );
  }

  Container selectedThemeIcon(String icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ImageIcon(AssetImage(icon), color: Colors.white),
    );
  }

  Container unselectedThemeIcon(String icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).colorScheme.primary),
      ),
      child: ImageIcon(
        AssetImage(icon),
        color: Theme.of(context).colorScheme.tertiary,
      ),
    );
  }
}
