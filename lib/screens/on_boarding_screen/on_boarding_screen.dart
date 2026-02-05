import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/app_assets.dart';
import 'package:evently_app/core/app_colors.dart';
import 'package:evently_app/core/app_styles.dart';
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
    var themeProvider = Provider.of<ThemeProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    String currentLanguage = context.locale.languageCode;

    return Scaffold(
      appBar: AppBar(title: Image.asset(AppAssets.topLogo, height: 40)),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.03,
          vertical: height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AppAssets.onBoardingImage,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            Text("onBoardingTitle".tr(), style: AppStyles.main20600),
            Text("onBoardingBody".tr(), style: AppStyles.main16400),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("language".tr(), style: AppStyles.main18500),
                Row(
                  spacing: width * 0.02,
                  children: [
                    InkWell(
                      onTap: () {
                        context.setLocale(const Locale('en'));
                      },
                      child: getLanguageIcon(
                        "english".tr(),
                        currentLanguage == 'en',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.setLocale(const Locale('ar'));
                      },
                      child: getLanguageIcon(
                        "arabic".tr(),
                        currentLanguage == 'ar',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("theme".tr(), style: AppStyles.main18500),
                Row(
                  spacing: width * 0.02,
                  children: [
                    InkWell(
                      onTap: () {
                        themeProvider.changeThemeMode(ThemeMode.light);
                      },
                      child: getThemeIcon(
                        AppAssets.sun,
                        !themeProvider.isDark(),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        themeProvider.changeThemeMode(ThemeMode.dark);
                      },
                      child: getThemeIcon(
                        AppAssets.moon,
                        themeProvider.isDark(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    IntroductionScreens.routeName,
                    (route) => false,
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

  Container getLanguageIcon(String language, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.mainColor : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected ? Colors.transparent : AppColors.mainColor,
        ),
      ),
      child: Text(
        language,
        style: AppStyles.onPrimary14600.copyWith(
          color: isSelected ? Colors.white : AppColors.mainColor,
        ),
      ),
    );
  }

  Container getThemeIcon(String icon, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.mainColor : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected ? Colors.transparent : AppColors.mainColor,
        ),
      ),
      child: ImageIcon(
        AssetImage(icon),
        color: isSelected ? Colors.white : AppColors.mainColor,
      ),
    );
  }
}
