import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/cache/cache_helper.dart';
import 'package:evently_app/core/provider/theme_provider.dart';
import 'package:evently_app/core/theme_data/app_theme.dart';
import 'package:evently_app/screens/auth/forget_password_screen.dart';
import 'package:evently_app/screens/auth/login_screen.dart';
import 'package:evently_app/screens/auth/register_screen.dart';
import 'package:evently_app/screens/main_screen/add_event_screen.dart';
import 'package:evently_app/screens/main_screen/edit_event_screen.dart';
import 'package:evently_app/screens/main_screen/event_details.dart';
import 'package:evently_app/screens/main_screen/main_screen.dart';
import 'package:evently_app/screens/on_boarding_screen/introduction_screens.dart';
import 'package:evently_app/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/provider/auth_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ChangeNotifierProvider(create: (context) => AuthProvider()),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<ThemeProvider>(context);
    var authProvider = Provider.of<AuthProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: myProvider.themeMode,

      initialRoute: CacheHelper.getOnBoardingState() ?? true
          ? OnBoardingScreen.routeName
          : authProvider.firebaseUser != null
          ? MainScreen.routeName
          : LoginScreen.routeName,

      routes: {
        OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
        IntroductionScreens.routeName: (context) => IntroductionScreens(),
        MainScreen.routeName: (context) => MainScreen(),
        AddEventScreen.routeName: (context) => AddEventScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen(),
        EventDetails.routeName: (context) => EventDetails(),
        EditEventScreen.routeName: (context) => EditEventScreen(),
      },
    );
  }
}
