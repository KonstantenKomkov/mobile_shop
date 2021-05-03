import 'package:shop/helpers/fetch.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/category.dart';

const shopUrl = "ostest.whitetigersoft.ru";

class DataFetch {
  Future<dynamic> getProduct() async {
    FetchHelper fetchData =
        new FetchHelper(shopUrl, '/api/common/product/list');

    var data = await fetchData.getData();
    var products = data
        .map<Product>((productJson) => Product.fromJson(productJson))
        .toList();
    return products;
  }

  Future<dynamic> getCategory() async {
    FetchHelper fetchData =
        new FetchHelper(shopUrl, '/api/common/category/list');

    var data = await fetchData.getData();
    var categories = data['categories']
        .map<Category>((categoryJson) => Category.fromJson(categoryJson))
        .toList();
    return categories;
  }
}
