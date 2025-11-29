import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/service_locator/getit/di.dart';
import 'package:news_app/features/articles/domain/entities/articles_entity.dart';
import 'package:news_app/features/articles/domain/entities/source_entity.dart';
import 'package:news_app/features/articles/presentation/view/widgets/article_card.dart';
import 'package:news_app/features/categories/view_model/category_cubit.dart';

import '../../../../common/widgets/error_widget.dart';
import '../view_model/cubit/adrticles_cubit.dart';
import '../view_model/cubit/articles_state.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryCubit categoryCubit = BlocProvider.of<CategoryCubit>(context);
    String searchText = ''; //

    return BlocProvider(
      create: (context) => getIt<ArticlesCubit>()
        ..getSources(categoryCubit.state!.name),
      child: BlocBuilder<ArticlesCubit, ArticlesState>(
        builder: (context, ArticlesState state) {
          if (state is GetSourcesLoading || state is ArticlesInitialState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetSourcesError) {
            return ErrorView(
              error: state.error,
              onRefresh: () => context.read<ArticlesCubit>().getSources(
                    categoryCubit.state!.name,
                  ),
            );
          }
          late List<SourceEntity> sources;
          Widget? searchBody;

          if (state is GetSourcesSuccess) {
            sources = state.sources;
          } else if (state is GetArticlesLoading) {
            sources = state.sources;
          } else if (state is GetArticlesError) {
            sources = state.sources;
          } else if (state is GetArticlesSuccess) {
            sources = state.sources;
          } else if (state is SearchArticlesLoading) {
            sources = [];
            searchBody = Center(child: CircularProgressIndicator());
          } else if (state is SearchArticlesSuccess) {
            sources = [];
            searchBody = ArticlesList(
              articles: state.results,
            );
          } else if (state is SearchArticlesError) {
            sources = [];
            searchBody = ErrorView(
              error: state.error,
              onRefresh: () {
                context.read<ArticlesCubit>().search(searchText);
              },
            );
          }
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    searchText = value;
                    context.read<ArticlesCubit>().search(searchText);
                  },
                  decoration: InputDecoration(
                    hintText: 'Search for articles...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                if (searchBody != null)
                  Expanded(child: searchBody)
                else
                  Expanded(
                    child: DefaultTabController(
                      length: (sources).length,
                      child: Column(
                        children: [
                          TabBar(
                            isScrollable: true,
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            dividerColor: Colors.transparent,
                            tabAlignment: TabAlignment.start,
                            tabs: (sources)
                                .map((source) => Tab(text: source.name))
                                .toList(),
                          ),
                          Expanded(
                            child: TabBarView(
                              children: (sources)
                                  .map(
                                    (e) => ArticlesList(
                                      sourceId: e.id ?? 'general',
                                      sources: sources,
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ArticlesList extends StatefulWidget {
  const ArticlesList({
    super.key,
    this.sourceId,
    this.sources,
    this.articles,
  });
  final String? sourceId;
  final List<SourceEntity>? sources;
  final List<ArticleEntity>? articles;

  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  @override
  void initState() {
    super.initState();
    if (widget.sourceId != null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        context.read<ArticlesCubit>().getArticles(
              widget.sourceId!,
              widget.sources!,
            );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.articles != null) {
      return ListView.builder(
        itemBuilder: (context, index) =>
            ArticleCardWidget(article: widget.articles![index]),
        itemCount: widget.articles!.length,
      );
    }
    return BlocBuilder<ArticlesCubit, ArticlesState>(
      builder: (context, state) {
        if (state is GetArticlesLoading || state is GetSourcesSuccess) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GetArticlesError) {
          return ErrorView(
            error: state.error,
            onRefresh: () => context.read<ArticlesCubit>().getArticles(
                  widget.sourceId!,
                  widget.sources!,
                ),
          );
        }
        List<ArticleEntity> articles = (state as GetArticlesSuccess).articles;
        return RefreshIndicator(
          onRefresh: () async {
            context.read<ArticlesCubit>().getArticles(
                  widget.sourceId!,
                  widget.sources!,
                );
          },
          child: ListView.builder(
            itemBuilder: (context, index) =>
                ArticleCardWidget(article: articles[index]),
            itemCount: articles.length,
          ),
        );
      },
    );
  }
}
