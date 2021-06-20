import 'package:flutter/material.dart';
import 'package:shop/models/category.dart';
import 'package:shop/helpers/constants.dart';

class CategoryGridItem extends StatelessWidget {
  final Category category;

  CategoryGridItem({
    Key key,
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.all(kDefaultPadding / 2),
        child: Column(
          children: [
            Text(
              category.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: _buildImage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Image.network(
      category.imageUrl,
      errorBuilder:
          (BuildContext context, Object exception, StackTrace stackTrace) {
        return Align(
          alignment: Alignment.center,
          child: Text('Изображение отсутствует'),
        );
      },
    );
  }
}
