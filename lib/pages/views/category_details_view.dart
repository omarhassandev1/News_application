import 'package:flutter/material.dart';
import 'package:news_app/enums/category_enum.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/models/source_response.dart';
import 'package:news_app/network/api_service.dart';
import 'package:news_app/providers/category_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/article_card.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {

    CategoryProvider provider = Provider.of<CategoryProvider>(context);
    CategoryEnum categoryEnum = provider.selectedCategory!;
    ApiService.getSources(categoryEnum.name);

    return FutureBuilder<SourceResponse?>(
      future: ApiService.getSources(categoryEnum.name),
      builder: (BuildContext context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (asyncSnapshot.hasError) {
          return Center(child: Text(asyncSnapshot.error.toString()));
        }
        List<Sources> sources = asyncSnapshot.data?.sources ?? [];
        return Padding(
          padding: const EdgeInsets.all(16),
          child: DefaultTabController(
            length: sources.length,
            child: Column(
              children: [
                TabBar(
                  isScrollable: true,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  dividerColor: Colors.transparent,
                  tabAlignment: TabAlignment.start,

                  tabs:
                      sources.map((source) => Tab(text: source.name)).toList(),
                ),
                Expanded(
                  child: TabBarView(
                    children:
                        sources
                            .map(
                              (e) => ArticlesList(sourceId: e.id ?? 'general'),
                            )
                            .toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ArticlesList extends StatelessWidget {
  const ArticlesList({super.key, required this.sourceId});
  final String sourceId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiService.getArticles(sourceId),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (asyncSnapshot.hasError) {
          return Center(child: Text(asyncSnapshot.error.toString()));
        }
        NewsResponse newsResponse = asyncSnapshot.data!;
        List<Articles> articles = newsResponse.articles ?? [];

        return ListView.builder(
          itemBuilder:
              (context, index) => ArticleCardWidget(article: articles[index]),
          itemCount: articles.length,
        );
      },
    );
  }
}
