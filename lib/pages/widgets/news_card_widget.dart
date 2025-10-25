import 'package:flutter/material.dart';

import '../../common/app_colors.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://gratisography.com/wp-content/uploads/2024/11/gratisography-augmented-reality-800x525.jpg',
            ),
          ),
          Text(
            '40-year-old man' * 5,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Row(
            spacing: 20,
            children: [
              Expanded(
                child: Text(
                  'data',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColors.grayColor,
                  ),
                ),
              ),
              Text(
                'data',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColors.grayColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
