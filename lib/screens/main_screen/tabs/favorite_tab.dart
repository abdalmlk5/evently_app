import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/app_assets.dart';
import 'package:evently_app/core/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../core/app_styles.dart';
import '../../../core/firebase/firebase_functions.dart';
import '../../../models/event_model.dart';
import '../../../widgets/event_item.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  List<EventModel> events = [];

  TextEditingController searchController = .new();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(height: height * 0.07),
        TextField(
          controller: searchController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: "search_for_event".tr(),
            suffixIcon: ImageIcon(
              AssetImage(AppAssets.searchIcon),
              color: AppColors.mainColor,
            ),
          ),
          onChanged: (value) {
            setState(() {});
          },
        ),
        SizedBox(height: height * 0.01),
        Expanded(
          child: StreamBuilder(
            stream: FirebaseFunctions.getStreamEventsFromFirestore(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }

              events = snapshot.data!.docs
                  .map((e) => EventModel.fromJson(e.data()))
                  .where((event) => event.isFavourite)
                  .where(
                    (event) => event.title.toLowerCase().contains(
                      searchController.text.toLowerCase(),
                    ),
                  )
                  .toList();

              return events.isEmpty
                  ? Center(
                      child: Text(
                        "No events founded",
                        style: AppStyles.secondary20500,
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.only(top: 10),
                      itemBuilder: (context, index) {
                        return EventItem(event: events[index]);
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(height: height * 0.01),
                      itemCount: events.length,
                    );
            },
          ),
        ),
      ],
    );
  }
}
