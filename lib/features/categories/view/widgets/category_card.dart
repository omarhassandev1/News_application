import 'package:flutter/material.dart';
import 'package:news_app/common/app_colors.dart';
import 'package:news_app/features/categories/view_model/category_provider.dart';
import 'package:provider/provider.dart';

import '../../model/enums/category_enum.dart';

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
    return GestureDetector(
      onTap:
          () => Provider.of<CategoryProvider>(
            context,
            listen: false,
          ).selectCategory(categoryEnum),
      child: Container(
        height: 200,
        width: double.infinity,
        alignment: isRight ? Alignment.centerLeft : Alignment.centerRight,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(categoryEnum.imagePath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(24),
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          crossAxisAlignment:
              isRight ? CrossAxisAlignment.start : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              categoryEnum.name,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
            !isRight
                ? Container(
                  decoration: BoxDecoration(
                    color: AppColors.grayColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: EdgeInsets.only(left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10,
                    children: [
                      Text(
                        'View all',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(15),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                )
                : Container(
                  decoration: BoxDecoration(
                    color: AppColors.grayColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: EdgeInsets.only(right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(15),
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        'View all',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
