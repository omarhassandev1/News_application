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
    return BlocProvider(
      create: (context) => getIt<ArticlesCubit>()..getSources(categoryCubit.state!.name),
      child: BlocBuilder<ArticlesCubit, ArticlesState>(
        builder: (context, ArticlesState state) {
          if (state is GetSourcesLoading || state is ArticlesInitialState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetSourcesError) {
            return ErrorView(
              error: state.error,
              onRefresh:
                  () => context.read<ArticlesCubit>().getSources(
                    categoryCubit.state!.name,
                  ),
            );
          }
          late List<SourceEntity> sources;

          if (state is GetSourcesSuccess) {
            sources = state.sources;
          } else if (state is GetArticlesLoading) {
            sources = state.sources;
          } else if (state is GetArticlesError) {
            sources = state.sources;
          } else if (state is GetArticlesSuccess) {
            sources = state.sources;
          }
          return Padding(
            padding: const EdgeInsets.all(16),
            child: DefaultTabController(
              length: (sources).length,
              child: Column(
                children: [
                  TabBar(
                    isScrollable: true,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    dividerColor: Colors.transparent,
                    tabAlignment: TabAlignment.start,

                    tabs:
                        (sources)
                            .map((source) => Tab(text: source.name))
                            .toList(),
                  ),
                  Expanded(
                    child: TabBarView(
                      children:
                          (sources)
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
          );
        },
      ),
    );
  }
}

class ArticlesList extends StatefulWidget {
  const ArticlesList({
    super.key,
    required this.sourceId,
    required this.sources,
  });
  final String sourceId;
  final List<SourceEntity> sources;

  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ArticlesCubit>().getArticles(
        widget.sourceId,
        widget.sources,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesCubit, ArticlesState>(
      builder: (context, state) {
        if (state is GetArticlesLoading || state is GetSourcesSuccess) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GetArticlesError) {
          return ErrorView(
            error: state.error,
            onRefresh:
                () => context.read<ArticlesCubit>().getArticles(
                  widget.sourceId,
                  widget.sources,
                ),
          );
        }
        List<ArticleEntity> articles =
            (state as GetArticlesSuccess).articles;
        return RefreshIndicator(
          onRefresh: () async {
            context.read<ArticlesCubit>().getArticles(
              widget.sourceId,
              widget.sources,
            );
          },
          child: ListView.builder(
            itemBuilder:
                (context, index) => ArticleCardWidget(article: articles[index]),
            itemCount: articles.length,
          ),
        );
      },
    );
  }
}
