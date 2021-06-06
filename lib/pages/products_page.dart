import 'package:flutter/material.dart';
import 'package:shop/helpers/queries.dart';
import 'package:shop/models/product.dart';
import 'package:shop/helpers/constants.dart';
import 'package:shop/models/product_list_item.dart';
import 'package:shop/models/category.dart';

class ProductListPage extends StatefulWidget {
  final Category category;
  ProductListPage({
    this.category,
  });

  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  Category category;
  DataFetch _productFetch = DataFetch();
  Future<List<Product>> productsFuture;

  @override
  void initState() {
    super.initState();
    //TODO: use optional widget.category (widget.category.categoryId)
    print(widget.category);
    if (widget.category?.categoryId == null) {
      productsFuture = _productFetch.loadProducts();
    } else {
      productsFuture = _productFetch.loadProducts(widget.category.categoryId);
    }
  }

  Widget build(BuildContext context) {
    String titleName;
    if (widget.category?.categoryId == null) {
      titleName = 'Товары';
    } else {
      titleName =
          '${widget.category.fullName.trim()[0]}${widget.category.fullName.trim().substring(1).toLowerCase()}';
    }
    return Scaffold(
      appBar: _buildAppBar(titleName),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar(String titleName) {
    return AppBar(
      title: Text(titleName),
    );
  }

  Widget _buildBody() {
    return FutureBuilder(
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
    );
  }
}
