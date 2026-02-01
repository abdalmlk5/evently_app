import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/app_colors.dart';
import 'package:evently_app/core/app_styles.dart';
import 'package:flutter/material.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    String currentLanguage = context.locale.languageCode;
    return Container(
      height: 180,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisAlignment: .spaceAround,
        children: [
          InkWell(
            onTap: () {
              context.setLocale(const Locale('en'));
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "english".tr(),
                  style: currentLanguage == 'en'
                      ? AppStyles.main20600.copyWith(color: AppColors.mainColor)
                      : AppStyles.main20600,
                ),
                if (currentLanguage == 'en')
                  Icon(Icons.check, color: AppColors.mainColor),
              ],
            ),
          ),
          const SizedBox(height: 24),
          InkWell(
            onTap: () {
              context.setLocale(const Locale('ar'));
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "arabic".tr(),
                  style: currentLanguage == 'ar'
                      ? AppStyles.main20600.copyWith(color: AppColors.mainColor)
                      : AppStyles.main20600,
                ),
                if (currentLanguage == 'ar')
                  Icon(Icons.check, color: AppColors.mainColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
