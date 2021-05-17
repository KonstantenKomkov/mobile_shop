import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Category {
  final int categoryId;
  final String title;
  final String imageUrl;
  final int hasSubcetegories;
  final String fullName;
  final String categoryDescription;

  Category({
    @required this.categoryId,
    @required this.title,
    @required this.imageUrl,
    @required this.hasSubcetegories,
    @required this.fullName,
    @required this.categoryDescription,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    var category = Category(
      categoryId: json['categoryId'] as int,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      hasSubcetegories: json['hasSubcetegories'] as int,
      fullName: json['fullName'] as String,
      categoryDescription: json['categoryDescription'] as String,
    );
    return category;
  }
}
