import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../common/app_colors.dart';
import '../../models/news_response.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'article_overlay_widget.dart';

class ArticleCardWidget extends StatelessWidget {
  const ArticleCardWidget({super.key, required this.article});

  final Articles article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          builder: (context) => ArticleOverlayWidget(article: article),
          context: context,
          useSafeArea: true,
          backgroundColor: Colors.transparent,
        );
      },
      child: Container(
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
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? '',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder:
                    (context, url) => Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                errorWidget: (context, url, error) => Icon(Icons.broken_image),
              ),
            ),
            Text(
              article.title ?? "",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Row(
              spacing: 20,
              children: [
                Expanded(
                  child: Text(
                    textAlign: TextAlign.justify,
                    (article.description ?? '').length > 100
                        ? '${article.description!.substring(0, 100)} ...show more'
                        : (article.description ?? ''),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColors.grayColor,
                    ),
                  ),
                ),
                Text(
                  timeago.format(DateTime.parse(article.publishedAt ?? '')),
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall!.copyWith(color: AppColors.grayColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
