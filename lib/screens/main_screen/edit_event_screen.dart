import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/app_assets.dart';
import 'package:evently_app/core/app_colors.dart';
import 'package:evently_app/core/app_styles.dart';
import 'package:evently_app/core/firebase/firebase_functions.dart';
import 'package:evently_app/core/provider/theme_provider.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/widgets/categories_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/provider/edit_event_screen_provider.dart';
import '../../models/category_model.dart';

class EditEventScreen extends StatefulWidget {
  static const routeName = "edit event screen";

  const EditEventScreen({super.key});

  @override
  State<EditEventScreen> createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  final GlobalKey<FormState> formKey = .new();
  final TextEditingController titleController = .new();
  final TextEditingController descriptionController = .new();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  final List<CategoryModel> categories = [
    CategoryModel(categoryName: "sport"),
    CategoryModel(categoryName: "birthday"),
    CategoryModel(categoryName: "book_club"),
    CategoryModel(categoryName: "meeting"),
    CategoryModel(categoryName: "exhibition"),
  ];

  @override
  Widget build(BuildContext context) {
    EventModel event = ModalRoute.of(context)!.settings.arguments as EventModel;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    titleController.text = event.title;
    descriptionController.text = event.description;
    selectedDate = event.date;
    selectedTime = TimeOfDay.fromDateTime(event.date);

    return ChangeNotifierProvider(
      create: (BuildContext context) => EditEventScreenProvider(
        selectedCategory: categories.indexWhere((element) {
          return element.categoryName == event.categoryName;
        }),
      ),
      builder: (context, child) {
        var myProvider = Provider.of<EditEventScreenProvider>(context);
        var themeProvider = Provider.of<ThemeProvider>(context);

        Future<void> updateEvent() async {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: CircularProgressIndicator(color: AppColors.mainColor),
            ),
          );
          event.title = titleController.text;
          event.description = descriptionController.text;
          event.date = selectedDate!;
          event.categoryName =
              categories[myProvider.selectedCategory].categoryName;
          event.time = selectedTime!;
          FirebaseFunctions.updateEvent(event: event);
          Navigator.pop(context);
          Navigator.pop(context);
        }

        return Scaffold(
          appBar: AppBar(
            title: Text("edit_event".tr(), style: AppStyles.secondary18500),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: height * 0.015,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        themeProvider.isDark()
                            ? categories[myProvider.selectedCategory].imageDark
                            : categories[myProvider.selectedCategory].image,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: CategoriesList(
                        categories: categories,
                        selectedCategory: myProvider.selectedCategory,
                        onTap: (index) {
                          myProvider.changeSelectedCategory(index);
                        },
                      ),
                    ),
                    Text("title".tr(), style: AppStyles.secondary16500),
                    TextFormField(
                      controller: titleController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter event title';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      textDirection: .ltr,
                      decoration: InputDecoration(hintText: "event_title".tr()),
                    ),
                    Text("description".tr(), style: AppStyles.secondary16500),
                    TextFormField(
                      controller: descriptionController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter event description';
                        }
                        return null;
                      },
                      textDirection: .ltr,

                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: "event_description".tr(),
                      ),
                      maxLines: 5,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            ImageIcon(
                              AssetImage(AppAssets.dateIcon),
                              color: AppColors.mainColor,
                            ),
                            Spacer(flex: 1),
                            Text(
                              "event_date".tr(),
                              style: AppStyles.secondary16500,
                            ),
                            Spacer(flex: 7),
                            TextButton(
                              onPressed: () {
                                chooseDate();
                              },
                              child: Text(
                                selectedDate == null
                                    ? "choose_date".tr()
                                    : DateFormat(
                                        'MMM d, y',
                                      ).format(selectedDate!),
                                style: AppStyles.primary14400.copyWith(
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2,
                                  decorationColor: AppColors.mainColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            ImageIcon(
                              AssetImage(AppAssets.timeIcon),
                              color: AppColors.mainColor,
                            ),
                            Spacer(flex: 1),
                            Text(
                              "event_time".tr(),
                              style: AppStyles.secondary16500,
                            ),
                            Spacer(flex: 7),
                            TextButton(
                              onPressed: () {
                                chooseTime();
                              },
                              child: Text(
                                selectedTime == null
                                    ? "choose_time".tr()
                                    : selectedTime!.format(context),
                                style: AppStyles.primary14400.copyWith(
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2,
                                  decorationColor: AppColors.mainColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }
                        if (selectedDate == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("no_date_message".tr())),
                          );
                          return;
                        }
                        if (selectedTime == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("no_time_message".tr())),
                          );
                          return;
                        }
                        updateEvent();
                      },
                      child: Text(
                        "edit_event".tr(),
                        style: AppStyles.white20500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> chooseDate() async {
    var chooseDate = showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    selectedDate = await chooseDate;

    setState(() {});
  }

  Future<void> chooseTime() async {
    var chooseTime = showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    selectedTime = await chooseTime;
    setState(() {});
  }
}
