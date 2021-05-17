import 'package:flutter/material.dart';
import 'package:shop/helpers/queries.dart';
import 'package:shop/models/category.dart';
import 'package:shop/helpers/constants.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoryPage> {
  DataFetch _categoryFetch = new DataFetch();

  Future<List<Category>> _getCategory() async {
    var categories = await _categoryFetch.getCategory();
    return categories;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
          future: _getCategory(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Загрузка..."),
                ),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  //
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding / 2),
                    child: GridView.builder(
                      itemCount: snapshot.data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: kDefaultPadding / 2,
                        crossAxisSpacing: kDefaultPadding / 2,
                      ),
                      itemBuilder: (BuildContext context, int index) =>
                          snapshot.data[index],
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}
