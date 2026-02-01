import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../models/category_model.dart';

class CategoriesList extends StatelessWidget {
  final List<CategoryModel> categories;
  final int selectedCategory;
  final Function(int index) onTap;

  const CategoriesList({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: categories.length,
      scrollDirection: .horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => onTap(index),
          child: selectedCategory != index
              ? getUnSelectedChip(index)
              : getSelectedChip(index),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(width: 10),
    );
  }

  Chip getSelectedChip(int index) {
    return Chip(
      backgroundColor: AppColors.mainColor,
      iconTheme: IconThemeData(color: Colors.white),
      label: Text(
        categories[index].categoryName.tr(),
        style: TextStyle(color: Colors.white),
      ),
      avatar: ImageIcon(AssetImage(categories[index].icon)),
    );
  }

  Chip getUnSelectedChip(int index) {
    return Chip(
      backgroundColor: AppColors.backgroundColor,
      iconTheme: IconThemeData(color: AppColors.mainColor),
      label: Text(
        categories[index].categoryName.tr(),
        style: TextStyle(color: AppColors.mainColor),
      ),
      avatar: ImageIcon(AssetImage(categories[index].icon)),
    );
  }
}
