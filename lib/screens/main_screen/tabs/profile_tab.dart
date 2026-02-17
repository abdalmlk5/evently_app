import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/app_assets.dart';
import 'package:evently_app/core/app_colors.dart';
import 'package:evently_app/core/app_styles.dart';
import 'package:evently_app/core/provider/theme_provider.dart';
import 'package:evently_app/widgets/language_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/firebase/firebase_functions.dart';
import '../../../core/provider/auth_provider.dart';
import '../../auth/login_screen.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var authProvider = Provider.of<AuthProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            child: Column(
              children: [
                SizedBox(height: height * 0.1),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.mainColor,
                  child: Image.asset(AppAssets.profilePic, fit: BoxFit.contain),
                ),
                SizedBox(height: height * 0.02),
                Text(
                  authProvider.user?.name ?? "",
                  style: AppStyles.secondary20600,
                ),
                SizedBox(height: height * 0.02),
                Text(
                  authProvider.user?.email ?? "",
                  style: AppStyles.secondary14400.copyWith(fontSize: 14),
                ),
                SizedBox(height: height * 0.03),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.mainColor),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("dark_mode".tr(), style: AppStyles.secondary20500),
                      Switch(
                        value: themeProvider.isDark(),
                        onChanged: (value) {
                          themeProvider.changeThemeMode(
                            value ? ThemeMode.dark : ThemeMode.light,
                          );
                        },
                        inactiveThumbColor: Colors.white,
                        activeThumbColor: Colors.white,
                        activeTrackColor: AppColors.mainColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => const LanguageBottomSheet(),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.mainColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("language".tr(), style: AppStyles.secondary20500),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.mainColor,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
                InkWell(
                  onTap: () {
                    FirebaseFunctions.logout();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      LoginScreen.routeName,
                      (route) => false,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.mainColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("logout".tr(), style: AppStyles.secondary20500),
                        const ImageIcon(
                          AssetImage(AppAssets.logoutIcon),
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
