import 'package:appdelivery/src/domain/entities/article.dart';

abstract class ArticleRepository{
  Future<List<Article>> listArticles();
}