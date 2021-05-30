import 'package:flutter/material.dart';
import 'package:shop/helpers/queries.dart';
import 'package:shop/models/product.dart';
import 'package:shop/helpers/constants.dart';
import 'package:shop/models/product_list_item.dart';

class ProductListPage extends StatefulWidget {
  // final List<Product> products;
  // ProductList({
  //   this.products,
  // });
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  DataFetch _productFetch = DataFetch();
  Future<List<Product>> productsFuture;

  @override
  void initState() {
    super.initState();
    productsFuture = _productFetch.loadProducts();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Товары'),
      ),
      body: FutureBuilder(
        future: productsFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductListItem(product: snapshot.data[index]);
              },
            );
          } else if (snapshot.hasError) {
            return Text("Error");
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
