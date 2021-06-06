import 'package:shop/helpers/fetch.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/category.dart';

const shopUrl = "ostest.whitetigersoft.ru";

class DataFetch {
  Future<List<Product>> loadProducts([int categoryId]) async {
    FetchHelper fetchData =
        new FetchHelper(shopUrl, '/api/common/product/list');

    //print('in loadProducts categoryId = ${categoryId.toString()}');
    // var data;
    // if (categoryId != null) {
    //   data = await fetchData.getData(categoryId);
    // } else {
    //   data = await fetchData.getData();
    // }
    var data;
    if (categoryId == null) {
      data = await fetchData.getData();
    } else {
      data = await fetchData.getData(categoryId: categoryId);
    }

    var products = data
        .map<Product>((productJson) => Product.fromJson(productJson))
        .toList();
    return products;
  }

  Future<List<Category>> loadCategories([int parentId]) async {
    FetchHelper fetchData =
        new FetchHelper(shopUrl, '/api/common/category/list');

    var data;
    if (parentId == null) {
      data = await fetchData.getData();
    } else {
      print(
          'Есть дочерние категории у категории с ID - ${parentId.toString()}');
      data = await fetchData.getData(parentId: parentId);
    }
    var categories = data['categories']
        .map<Category>((categoryJson) => Category.fromJson(categoryJson))
        .toList();
    return categories;
  }
}
