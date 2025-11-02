import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/categories/model/enums/category_enum.dart';

class CategoryCubit extends Cubit<CategoryEnum?>{
  CategoryCubit():super(null);

  selectCategory(CategoryEnum category){
    emit(category);
  }

  emptyCategory(){
    emit(null);
  }
}