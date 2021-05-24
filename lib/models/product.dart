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
      {this.productId,
      this.title,
      this.productDescription,
      this.price,
      this.rating,
      this.imageUrl,
      this.images,
      this.isAvailableForSale});

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
