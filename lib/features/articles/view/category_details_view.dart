import 'package:flutter/material.dart';
import 'package:news_app/features/articles/view/widgets/article_card.dart';
import 'package:news_app/features/articles/model/news_response.dart';
import 'package:news_app/features/articles/view_model/articles_provider.dart';
import 'package:news_app/features/articles/model/source_response.dart';
import 'package:news_app/features/articles/model/api_service.dart';
import 'package:news_app/features/categories/view_model/category_provider.dart';
import 'package:provider/provider.dart';

import '../../categories/model/enums/category_enum.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryProvider provider = Provider.of<CategoryProvider>(context);
    CategoryEnum categoryEnum = provider.selectedCategory!;
    ApiService.getSources(categoryEnum.name);

    return ChangeNotifierProvider(
      create:
          (BuildContext context) =>
              ArticlesProvider()..getSources(categoryEnum.name),
      child: Consumer<ArticlesProvider>(
        builder: (context, viewModel, child) {
          if (viewModel.sourcesLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (viewModel.sourcesError != null) {
            return ErrorView(error: viewModel.sourcesError!,onRefresh: ()=> viewModel.getSources(categoryEnum.name),);
          }
          List<Sources> sources = viewModel.sources?.sources ?? [];
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
                        sources
                            .map((source) => Tab(text: source.name))
                            .toList(),
                  ),
                  Expanded(
                    child: TabBarView(
                      children:
                          sources
                              .map(
                                (e) =>
                                    ArticlesList(sourceId: e.id ?? 'general'),
                              )
                              .toList(),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ArticlesList extends StatefulWidget {
  const ArticlesList({super.key, required this.sourceId});
  final String sourceId;

  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ArticlesProvider>().getArticles(widget.sourceId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticlesProvider>(
      builder: (
        BuildContext context,
        ArticlesProvider viewModel,
        Widget? child,
      ) {
        if (viewModel.articlesLoading || viewModel.articles == null) {
          return Center(child: CircularProgressIndicator());
        } else if (viewModel.articleError != null) {
          return ErrorView(error: viewModel.articleError!,onRefresh: () => viewModel.getArticles(widget.sourceId)
          ,);
        }
        NewsResponse newsResponse = viewModel.articles!;
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

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    required this.error, this.onRefresh,
  });

  final String error;
  final void Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(error),
          FilledButton.icon(
            onPressed: onRefresh,
            label: Text('Reload',textAlign: TextAlign.center,),
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
