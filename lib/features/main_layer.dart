import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/articles/view/category_details_view.dart';
import 'package:news_app/features/categories/model/enums/category_enum.dart';
import 'package:news_app/features/categories/view/category_list_view.dart';
import 'package:news_app/features/categories/view_model/category_cubit.dart';

import 'categories/view/home_drawer.dart';

class MainLayer extends StatelessWidget {
  const MainLayer({super.key});

  static const String routeName = '/mainLayer';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(),
      child: BlocBuilder<CategoryCubit, CategoryEnum?>(
        builder:
            (context, CategoryEnum? state) => Scaffold(
              drawer: HomeDrawer(),
              appBar: AppBar(
                title: Text(state != null ? state.name : 'Home'),
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                ],
              ),
              body: state == null ? CategoryListView() : CategoryDetailsView(),
            ),
      ),
    );
  }
}
