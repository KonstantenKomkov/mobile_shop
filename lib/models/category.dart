import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shop/helpers/constants.dart';

class Category extends StatelessWidget {
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
      categoryId: json['categoryId'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      hasSubcetegories: json['hasSubcetegories'],
      fullName: json['fullName'],
      categoryDescription: json['categoryDescription'],
    );
    return category;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(kDefaultPadding / 2),
        child: Column(
          children: [
            Text(
              this.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Image.network(this.imageUrl),
          ],
        ),
      ),
    );
  }
}
