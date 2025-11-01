import 'package:flutter/material.dart';
import 'package:news_app/features/articles/view/category_details_view.dart';
import 'package:news_app/features/categories/view/category_list_view.dart';
import 'package:news_app/features/categories/view_model/category_provider.dart';
import 'package:provider/provider.dart';

import 'categories/view/home_drawer.dart';

class MainLayer extends StatelessWidget {
  const MainLayer({super.key});

  static const String routeName = '/mainLayer';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoryProvider(),
      child: Consumer<CategoryProvider>(
        builder:
            (context, value, child) => Scaffold(
              drawer: HomeDrawer(),
              appBar: AppBar(
                title: Text(
                  value.selectedCategory != null
                      ? value.selectedCategory!.name
                      : 'Home',
                ),
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                ],
              ),
              body:
                  value.selectedCategory == null
                      ? CategoryListView()
                      : CategoryDetailsView(),
            ),
      ),
    );
  }
}
