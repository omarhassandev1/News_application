
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../common/app_colors.dart';
import '../../model/news_response.dart';


class ArticleOverlayWidget extends StatelessWidget {
  const ArticleOverlayWidget({super.key, required this.article});
  final Articles article;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 8,
              mainAxisSize: MainAxisSize.min,
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
                    errorWidget:
                        (context, url, error) => Icon(Icons.broken_image),
                  ),
                ),

                Flexible(
                  child: Text(
                    article.content ?? 'something went wrong',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      backgroundColor:
                      Theme.of(context).scaffoldBackgroundColor,
                      padding: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'View full article',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
