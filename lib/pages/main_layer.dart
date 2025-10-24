import 'package:flutter/material.dart';
import 'package:news_app/enums/category_enum.dart';
import 'package:news_app/pages/widgets/category_card.dart';

class MainLayer extends StatelessWidget {
  const MainLayer({super.key});

  static const String routeName = '/mainLayer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(title: Text('Home')),
      body: SingleChildScrollView(
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
      ),
    );
  }
}
