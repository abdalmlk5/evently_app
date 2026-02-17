import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/app_styles.dart';
import 'package:evently_app/core/firebase/firebase_functions.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../core/app_colors.dart';
import '../core/provider/theme_provider.dart';
import '../screens/event_screens/event_details.dart';

class EventItem extends StatelessWidget {
  final EventModel event;

  const EventItem({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EventDetails.routeName, arguments: event);
      },
      child: SizedBox(
        width: double.infinity,
        height: height * 0.23,
        child: PhysicalModel(
          color: Colors.transparent,
          elevation: 5,
          shadowColor: AppColors.secondaryTextColor.withAlpha(100),
          borderRadius: BorderRadius.circular(20),
          child: Slidable(
            startActionPane: ActionPane(
              motion: StretchMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    FirebaseFunctions.deleteEvent(event: event);
                  },
                  borderRadius: BorderRadius.circular(16),
                  label: 'delete'.tr(),
                  icon: Icons.delete,
                  backgroundColor: AppColors.redColor,
                ),
              ],
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    themeProvider.isDark()
                        ? event.category.imageDark
                        : event.category.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Column(
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.strokeColor,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        // DateFormat("d MMM").format(event.date),
                        DateFormat(
                          "d MMM",
                          context.locale.toString(),
                        ).format(event.date),
                        style: AppStyles.primary16600,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.strokeColor,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(event.title, style: AppStyles.primary16600),
                          InkWell(
                            onTap: () {
                              event.isFavourite = !event.isFavourite;
                              FirebaseFunctions.updateEventFavourite(
                                event: event,
                              );
                            },
                            child: Icon(
                              event.isFavourite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: AppColors.mainColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
