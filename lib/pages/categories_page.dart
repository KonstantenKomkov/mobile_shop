import 'package:flutter/material.dart';
import 'package:shop/pages/products_page.dart';
import 'package:shop/models/category.dart';
import 'package:shop/models/grid_item.dart';
import 'package:shop/helpers/constants.dart';
import 'package:shop/helpers/queries.dart';

class CategoryGridPage extends StatefulWidget {
  // final List<Category> categories;
  // CategoryGridPage({
  //   this.categories,
  // });

  _CategoryGridPageState createState() => _CategoryGridPageState();
}

class _CategoryGridPageState extends State<CategoryGridPage> {
  DataFetch _categoryFetch = DataFetch();
  Future<List<Category>> categoriesFuture;

  @override
  void initState() {
    super.initState();
    categoriesFuture = _categoryFetch.loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Категории'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: kDefaultPadding / 4,
              left: kDefaultPadding / 2,
            ),
            child: ElevatedButton(
              onPressed: () {
                Route route = MaterialPageRoute(
                  builder: (context) => ProductListPage(),
                );
                Navigator.push(context, route);
              },
              child: Text('Все товары'),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: kDefaultPadding / 2,
                right: kDefaultPadding / 2,
              ),
              child: FutureBuilder(
                future: categoriesFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return _categoriesGridView(snapshot);
                  } else if (snapshot.hasError) {
                    return Text("Error");
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoriesGridView(snapshot) {
    return GridView.builder(
      itemCount: snapshot.data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: kDefaultPadding / 2,
        crossAxisSpacing: kDefaultPadding / 2,
      ),
      itemBuilder: (context, index) {
        return CategoryGridItem(
          category: snapshot.data[index],
        );
      },
    );
  }
}
