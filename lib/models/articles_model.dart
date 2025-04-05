class ArticlesModel {
  List<Map<String, dynamic>> articles;

  ArticlesModel({required this.articles});

  factory ArticlesModel.fromJson(Map<String, dynamic> data) {
    List<Map<String, dynamic>> minArticles = [];

    for (var article in data['articles']) {
      minArticles.add({
        'title': article['title'],
        'description': article['description'],
        'urlImage': article['urlToImage'],
      });
    }

    return ArticlesModel(articles: minArticles);
  }
}
