import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/helpers/constants.dart';

class ProductListItem extends StatelessWidget {
  final Product product;
  ProductListItem({
    this.product,
  });

  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(kDefaultPadding / 2),
        child: Column(
          children: [
            Text(
              product.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Image.network(
              product.imageUrl,
            ),
            Container(
              padding: EdgeInsets.only(
                top: kDefaultPadding / 2,
              ),
              alignment: Alignment.centerRight,
              child: Text(
                'Цена: ${product.price} руб.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
