import 'package:flutter/material.dart';

import '../../enums/category_enum.dart';
import '../widgets/category_card.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('''Good Morning
Here is Some News For You''', style: Theme.of(context).textTheme.headlineSmall),
            ...List.generate(
              CategoryEnum.values.length,
                  (index) => CategoryCard(
                categoryEnum: CategoryEnum.values[index],
                isRight: index % 2 != 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
