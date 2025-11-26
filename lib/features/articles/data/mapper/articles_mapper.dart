import 'package:news_app/features/articles/data/models/news_response.dart';
import 'package:news_app/features/articles/domain/entities/articles_entity.dart';

extension ArticlesMapper on Articles {
  ArticleEntity getEntity() => ArticleEntity(
    title: title,
    description: description,
    url: url,
    urlToImage: urlToImage,
    publishedAt: publishedAt,
    content: content
  );
}
