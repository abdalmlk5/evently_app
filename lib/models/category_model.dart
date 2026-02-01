class CategoryModel {
  String categoryName;
  late String image;
  late String imageDark;
  late String icon;

  CategoryModel({required this.categoryName}) {
    imageDark = "assets/images/${categoryName}_image_dark.png";
    image = "assets/images/${categoryName}_image_light.png";
    icon = "assets/images/icons/${categoryName}_icon.png";
  }
}
