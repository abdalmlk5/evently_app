import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/app_assets.dart';
import 'package:evently_app/core/app_styles.dart';
import 'package:evently_app/core/firebase/firebase_functions.dart';
import 'package:evently_app/models/category_model.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/app_colors.dart';
import '../../core/provider/theme_provider.dart';
import 'edit_event_screen.dart';

class EventDetails extends StatefulWidget {
  static const routeName = "event details";

  const EventDetails({super.key});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    EventModel event = ModalRoute.of(context)!.settings.arguments as EventModel;

    return Scaffold(
      appBar: AppBar(
        title: Text("event_details".tr()),
        centerTitle: true,
        actionsPadding: EdgeInsets.symmetric(horizontal: 16),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                EditEventScreen.routeName,
                arguments: event,
              );
            },
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: AppColors.strokeColor, width: 2),
              ),
              color: AppColors.inputsColor,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ImageIcon(
                  AssetImage(AppAssets.editIcon),
                  color: AppColors.mainColor,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              FirebaseFunctions.deleteEvent(event: event);
              Navigator.pop(context);
            },
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: AppColors.strokeColor, width: 2),
              ),
              color: AppColors.inputsColor,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ImageIcon(
                  AssetImage(AppAssets.deleteIcon),
                  color: AppColors.redColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.02),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  themeProvider.isDark()
                      ? CategoryModel(
                          categoryName: event.categoryName,
                        ).imageDark
                      : CategoryModel(categoryName: event.categoryName).image,
                  width: double.infinity,
                  height: height * 0.25,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: height * 0.03),
              Center(child: Text(event.title, style: AppStyles.secondary20500)),
              SizedBox(height: height * 0.03),
              _buildInfoRow(
                context,
                icon: AppAssets.dateIcon,
                title: DateFormat(
                  'd MMMM, y',
                  context.locale.toString(),
                ).format(event.date),
                subtitle: event.time.format(context),
              ),
              SizedBox(height: height * 0.02),
              Text("description".tr(), style: AppStyles.secondary16500),
              SizedBox(height: height * 0.01),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.inputsColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.strokeColor, width: 2),
                ),
                child: Text(event.description, style: AppStyles.secondary14400),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required String icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.inputsColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.strokeColor, width: 2),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.strokeColor, width: 2),
            ),
            child: ImageIcon(
              AssetImage(icon),
              size: 40,
              color: AppColors.mainColor,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppStyles.primary16600),
                Text(subtitle, style: AppStyles.secondary16500),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
