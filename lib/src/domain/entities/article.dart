class Article{
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  Article({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Article.fromJson(Map<String, dynamic> data):
    author = data['author'] ?? '',
    title = data['title'] ?? '',
    description = data['description'] ?? '',
    url = data['url'] ?? '',
    urlToImage = data['urlToImage'] ?? '',
    publishedAt = DateTime.parse(data['publishedAt']),
    content = data['content'] ?? '';
} 