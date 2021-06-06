class Category {
  final int categoryId;
  final String title;
  final String imageUrl;
  final int hasSubcategories;
  final String fullName;
  final String categoryDescription;

  Category({
    this.categoryId,
    this.title,
    this.imageUrl,
    this.hasSubcategories,
    this.fullName,
    this.categoryDescription,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    var category = Category(
      categoryId: json['categoryId'] as int,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      hasSubcategories: json['hasSubcategories'] as int,
      fullName: json['fullName'] as String,
      categoryDescription: json['categoryDescription'] as String,
    );
    return category;
  }
}
