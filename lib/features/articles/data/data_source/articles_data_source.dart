abstract class ArticlesDataSource {
  getSources(String catId);

  getArticles(String sourceId);

  searchArticles(String query);
}
