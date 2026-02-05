import 'package:evently_app/models/category_model.dart';
import 'package:flutter/material.dart';

class EventModel {
  ///collection name
  static const String collectionName = 'events';

  ///attributes
  String id, userId;
  String title;
  String description;
  String categoryName;
  DateTime date;
  TimeOfDay time;
  bool isFavourite;

  late CategoryModel category;

  ///constructor
  EventModel({
    this.id = '',
    required this.userId,
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
      'time': "${time.hour}:${time.minute}",
      'isFavourite': isFavourite,
      'userId': userId,
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
        time: TimeOfDay(
          hour: int.parse(data['time'].split(":")[0]),
          minute: int.parse(data['time'].split(":")[1]),
        ),
        isFavourite: data['isFavourite'],
        userId: data['userId'],
      );
}
