import 'package:flutter/material.dart';
import 'package:shop/helpers/queries.dart';
import 'package:shop/models/product.dart';
//import 'package:shop/helpers/constants.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductPage> {
  DataFetch _productFetch = new DataFetch();

  Future<List<Product>> _getProducts() async {
    var products = await _productFetch.getProduct();
    return products;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
          future: _getProducts(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Загрузка..."),
                ),
              );
            } else {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) =>
                      snapshot.data[index]);
            }
          }),
    );
  }
}
