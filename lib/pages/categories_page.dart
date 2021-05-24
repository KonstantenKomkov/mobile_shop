import 'package:flutter/material.dart';
import 'package:shop/pages/products_page.dart';
import 'package:shop/models/category.dart';
import 'package:shop/helpers/constants.dart';
import 'package:shop/helpers/queries.dart';

class CategoryGridItem extends StatelessWidget {
  final Category category;
  CategoryGridItem({
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.all(kDefaultPadding / 2),
        child: Column(
          children: [
            Text(
              category.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Image.network(category.imageUrl),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryGrid extends StatefulWidget {
  final List<Category> categories;
  CategoryGrid({
    this.categories,
  });

  _CategoryGridState createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  DataFetch _categoryFetch = DataFetch();
  Future<List<Category>> categories;

  @override
  void initState() {
    super.initState();
    categories = _categoryFetch.loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: kDefaultPadding / 2,
          right: kDefaultPadding / 2,
        ),
        child: FutureBuilder(
          future: categories,
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
      itemBuilder: (context, index) {
        return CategoryGridItem(
          category: snapshot.data[index],
        );
      },
    );
  }
}

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
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
                  builder: (context) => ProductsPage(),
                );
                Navigator.push(context, route);
              },
              child: Text('Все товары'),
            ),
          ),
          CategoryGrid(),
        ],
      ),
    );
  }
}
