import 'package:flutter/material.dart';
import 'package:news_app/enums/category_enum.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoryEnum,
    required this.isRight,
  });

  final CategoryEnum categoryEnum;
  final bool isRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      alignment: isRight ? Alignment.centerLeft : Alignment.centerRight,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(categoryEnum.imagePath)),
        borderRadius: BorderRadius.circular(24),
        color: Theme.of(context).primaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            categoryEnum.name,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        ],
      ),
    );
  }
}
