import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/firebase/firebase_functions.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/widgets/event_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/app_assets.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_styles.dart';
import '../../../core/provider/home_tab_provider.dart';
import '../../../core/provider/theme_provider.dart';
import '../../../models/category_model.dart';
import '../../../widgets/categories_list.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late HomeTabProvider myProvider;
  final List<CategoryModel> categories = [
    CategoryModel(categoryName: "all"),
    CategoryModel(categoryName: "sport"),
    CategoryModel(categoryName: "birthday"),
    CategoryModel(categoryName: "book_club"),
    CategoryModel(categoryName: "meeting"),
    CategoryModel(categoryName: "exhibition"),
  ];
  List<EventModel> events = [];

  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadEvents();
  }

  Future<void> loadEvents() async {
    events = await FirebaseFunctions.getEventsFromFirestore();
    setState(() {});
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<ThemeProvider>(context);
    String currentLanguage = context.locale.languageCode;

    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeTabProvider(),

      builder: (context, child) {
        myProvider = Provider.of<HomeTabProvider>(context);
        return Column(
          children: [
            SizedBox(height: height * 0.07),
            Row(
              children: [
                Column(
                  crossAxisAlignment: .start,
                  spacing: height * 0.005,
                  children: [
                    Text("welcome_back".tr(), style: AppStyles.secondary18500),
                    Text("User Name", style: AppStyles.secondary20500),
                  ],
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    themeProvider.isDark()
                        ? themeProvider.changeThemeMode(ThemeMode.light)
                        : themeProvider.changeThemeMode(ThemeMode.dark);
                  },
                  child: ImageIcon(
                    AssetImage(
                      themeProvider.isDark() ? AppAssets.moon : AppAssets.sun,
                    ),
                    color: AppColors.mainColor,
                  ),
                ),
                SizedBox(width: 15),
                InkWell(
                  onTap: () {
                    currentLanguage == 'en'
                        ? context.setLocale(const Locale('ar'))
                        : context.setLocale(const Locale('en'));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      currentLanguage.toUpperCase(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.03),
            SizedBox(
              height: 40,
              child: CategoriesList(
                categories: categories,
                selectedCategory: myProvider.selectedCategory,
                onTap: (int index) {
                  myProvider.changeSelectedCategory(index);
                },
              ),
            ),
            SizedBox(height: height * 0.01),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFunctions.getStreamEventsFromFirestore(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    events = snapshot.data!.docs
                        .map((e) => EventModel.fromJson(e))
                        .toList();

                    if (myProvider.selectedCategory != 0) {
                      events = events.where((event) {
                        return event.categoryName ==
                            categories[myProvider.selectedCategory]
                                .categoryName;
                      }).toList();
                    }
                    return events.isEmpty
                        ? Center(
                            child: Text(
                              "No events founded",
                              style: AppStyles.secondary20500,
                            ),
                          )
                        : ListView.separated(
                            padding: EdgeInsets.only(top: 10),
                            itemBuilder: (context, index) {
                              return EventItem(event: events[index]);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    SizedBox(height: height * 0.01),
                            itemCount: events.length,
                          );
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
