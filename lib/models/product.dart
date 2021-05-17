import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Product {
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
      productId: json['productId'] as int,
      title: json['title'] as String,
      productDescription: json['productDescription'] as String,
      price: json['price'] as num,
      rating: json['rating'] as String,
      imageUrl: json['imageUrl'] as String,
      images: json['images'] as List,
      isAvailableForSale: json['isAvailableForSale'] as int,
    );
    return product;
  }
}
