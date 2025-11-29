import 'package:flutter/material.dart';

import '../../../generated/app_localizations.dart';
import '../model/enums/category_enum.dart';
import 'widgets/category_card.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.goodMorning,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            ...List.generate(
              CategoryEnum.values.length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CategoryCard(
                  categoryEnum: CategoryEnum.values[index],
                  isRight: index % 2 != 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
