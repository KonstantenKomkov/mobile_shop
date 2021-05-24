import 'package:flutter/material.dart';
import 'package:shop/helpers/queries.dart';
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

class ProductList extends StatefulWidget {
  final List<Product> products;
  ProductList({
    this.products,
  });
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  DataFetch _productFetch = DataFetch();
  Future<List<Product>> products;

  @override
  void initState() {
    super.initState();
    products = _productFetch.loadProducts();
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: products,
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

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Товары'),
      ),
      body: ProductList(),
    );
  }
}
