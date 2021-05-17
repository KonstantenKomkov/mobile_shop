import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/helpers/queries.dart';
import 'package:shop/helpers/constants.dart';

class ProductListItem extends StatefulWidget {
  _ProductListItemState createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  DataFetch _productFetch = new DataFetch();

  Future<List<Product>> products;
  @override
  void initState() {
    super.initState();
    products = _productFetch.getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
          future: products,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _productsListView(snapshot);
            } else if (snapshot.hasError) {
              return Text("Error");
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

Widget _productsListView(snapshot) {
  return ListView.builder(
      padding: EdgeInsets.all(kDefaultPadding / 2),
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        return _productItem(snapshot, index);
      });
}

Widget _productItem(snapshot, int index) {
  return Card(
    child: Padding(
      padding: EdgeInsets.all(kDefaultPadding / 2),
      child: Column(
        children: [
          Text(
            snapshot.data[index].title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Image.network(snapshot.data[index].imageUrl),
          Container(
            padding: EdgeInsets.only(top: kDefaultPadding / 2),
            alignment: Alignment.centerRight,
            child: Text(
              'Цена: ${snapshot.data[index].price} руб.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    ),
  );
}
