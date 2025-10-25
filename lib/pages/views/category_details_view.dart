import 'package:flutter/material.dart';
import 'package:news_app/common/app_colors.dart';

import '../widgets/news_card_widget.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: DefaultTabController(
        length: 6,
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              padding: EdgeInsets.symmetric(horizontal: 8),
              dividerColor: Colors.transparent,
              tabAlignment: TabAlignment.start,

              tabs: [
                Tab(text: 'first'),
                Tab(text: 'second'),
                Tab(text: 'second'),
                Tab(text: 'second'),
                Tab(text: 'second'),
                Tab(text: 'second'),
              ],
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemBuilder: (context, index) => NewsCardWidget(),
                    itemCount: 5,

                  ),
                  ListView.builder(
                    itemBuilder: (context, index) => NewsCardWidget(),
                    itemCount: 5,

                  ),
                  ListView.builder(
                    itemBuilder: (context, index) => NewsCardWidget(),
                    itemCount: 5,

                  ),
                  ListView.builder(
                    itemBuilder: (context, index) => NewsCardWidget(),
                    itemCount: 5,

                  ),
                  ListView.builder(
                    itemBuilder: (context, index) => NewsCardWidget(),
                    itemCount: 5,

                  ),
                  ListView.builder(
                    itemBuilder: (context, index) => NewsCardWidget(),
                    itemCount: 5,

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
