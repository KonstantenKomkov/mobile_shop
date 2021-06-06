import 'package:flutter/material.dart';
import 'package:shop/pages/products_page.dart';
import 'package:shop/models/category.dart';
import 'package:shop/models/grid_item.dart';
import 'package:shop/helpers/constants.dart';
import 'package:shop/helpers/queries.dart';

class CategoryGridPage extends StatefulWidget {
  final Category parentCategory;

  CategoryGridPage({
    this.parentCategory,
  });

  _CategoryGridPageState createState() => _CategoryGridPageState();
}

class _CategoryGridPageState extends State<CategoryGridPage> {
  //TODO: pass optional data from widget.category
  DataFetch _categoryFetch = DataFetch();
  Future<List<Category>> categoriesFuture;

  @override
  void initState() {
    super.initState();
    if (widget.parentCategory?.categoryId == null) {
      categoriesFuture = _categoryFetch.loadCategories();
    } else {
      categoriesFuture =
          _categoryFetch.loadCategories(widget.parentCategory.categoryId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('Категории'),
      centerTitle: true,
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildButton(),
        _buildContent(),
      ],
    );
  }

  Widget _buildButton() {
    return Padding(
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
    );
  }

  Widget _buildContent() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: kDefaultPadding / 2,
          right: kDefaultPadding / 2,
        ),
        child: FutureBuilder(
          future: categoriesFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _buildCategoriesGridView(snapshot.data);
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

  Widget _buildCategoriesGridView(List<Category> categories) {
    return GridView.builder(
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: kDefaultPadding / 2,
          crossAxisSpacing: kDefaultPadding / 2,
        ),
        itemBuilder: (context, index) {
          var category = categories[index];
          return _buildGridItem(context, category);
        });
  }

  Widget _buildGridItem(BuildContext context, Category category) {
    return InkWell(
      onTap: () => onItemTap(category),
      child: CategoryGridItem(
        category: category,
      ),
    );
  }

  void onItemTap(Category category) {
    if (category.hasSubcategories == 1) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CategoryGridPage(
          parentCategory: category,
        ),
      ));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ProductListPage(
          category: category,
        ),
      ));
    }
  }
}
