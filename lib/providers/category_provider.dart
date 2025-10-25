import 'package:flutter/material.dart';
import 'package:news_app/enums/category_enum.dart';

class CategoryProvider extends ChangeNotifier{
  CategoryEnum? selectedCategory;

  selectCategory(CategoryEnum category){
    selectedCategory = category;
    notifyListeners();
  }

  emptyCategory(){
    selectedCategory = null;
    notifyListeners();
  }
}