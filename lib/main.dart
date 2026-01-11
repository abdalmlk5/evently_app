import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/provider/theme_provider.dart';
import 'package:evently_app/core/theme_data/app_theme.dart';
import 'package:evently_app/screens/home_screen.dart';
import 'package:evently_app/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:evently_app/screens/on_boarding_screen/introduction_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: ChangeNotifierProvider(
        create: (BuildContext context) => ThemeProvider(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: myProvider.themeMode,

      initialRoute: OnBoardingScreen.routeName,
      routes: {
        OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
        IntroductionScreens.routeName: (context) => IntroductionScreens(),
        HomeScreen.routName: (context) => const HomeScreen(),
      },
    );
  }
}
