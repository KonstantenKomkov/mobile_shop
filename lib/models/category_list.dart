import 'package:flutter/material.dart';
import 'package:shop/helpers/queries.dart';
import 'package:shop/models/category.dart';
import 'package:shop/helpers/constants.dart';

class CategoryGridItem extends StatefulWidget {
  _CategoryGridItemState createState() => _CategoryGridItemState();
}

class _CategoryGridItemState extends State<CategoryGridItem> {
  DataFetch _categoryFetch = new DataFetch();

  Future<List<Category>> categories;
  @override
  void initState() {
    super.initState();
    categories = _categoryFetch.getCategory();
  }

  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
          future: categories,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _categoriesGridView(snapshot);
            } else if (snapshot.hasError) {
              return Text("Error");
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  _categoriesGridView(snapshot) {
    return GridView.builder(
      itemCount: snapshot.data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: kDefaultPadding / 2,
        crossAxisSpacing: kDefaultPadding / 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return _categoryItem(snapshot, index);
      },
    );
  }
}

Widget _categoryItem(snapshot, index) {
  return Card(
    clipBehavior: Clip.antiAlias,
    child: Padding(
      padding: EdgeInsets.all(kDefaultPadding / 2),
      child: Column(
        children: [
          Text(
            snapshot.data[index].title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Expanded(child: Image.network(snapshot.data[index].imageUrl)),
        ],
      ),
    ),
  );
}
