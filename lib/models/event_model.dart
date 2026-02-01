import 'package:evently_app/models/category_model.dart';

class EventModel {
  ///collection name
  static const String collectionName = 'events';

  ///attributes
  String id;
  String title;
  String description;
  String categoryName;
  DateTime date;
  String time;
  bool isFavourite;

  late CategoryModel category;

  ///constructor
  EventModel({
    this.id = '',
    required this.title,
    required this.description,
    required this.categoryName,
    required this.date,
    required this.time,
    this.isFavourite = false,
  }) {
    category = CategoryModel(categoryName: categoryName);
  }

  /// object => json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'categoryName': categoryName,
      'date': date.millisecondsSinceEpoch,
      'time': time,
      'isFavourite': isFavourite,
    };
  }

  /// json => object
  EventModel.fromJson(data)
    : this(
        id: data['id'],
        title: data['title'],
        description: data['description'],
        categoryName: data['categoryName'],
        date: DateTime.fromMillisecondsSinceEpoch(data['date']),
        time: data['time'],
        isFavourite: data['isFavourite'],
      );
}
