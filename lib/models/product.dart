import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shop/helpers/constants.dart';

class Product extends StatelessWidget {
  final int productId;
  final String title;
  final String productDescription;
  final num price;
  final String rating;
  final String imageUrl;
  final List images;
  final int isAvailableForSale;

  Product(
      {@required this.productId,
      @required this.title,
      @required this.productDescription,
      @required this.price,
      @required this.rating,
      @required this.imageUrl,
      @required this.images,
      @required this.isAvailableForSale});

  factory Product.fromJson(Map<String, dynamic> json) {
    var product = Product(
      productId: json['productId'],
      title: json['title'],
      productDescription: json['productDescription'],
      price: json['price'],
      rating: json['rating'],
      imageUrl: json['imageUrl'],
      images: json['images'],
      isAvailableForSale: json['isAvailableForSale'],
    );
    return product;
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
            Container(
              padding: EdgeInsets.only(top: kDefaultPadding / 2),
              alignment: Alignment.centerRight,
              child: Text(
                'Цена: ${this.price} руб.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
