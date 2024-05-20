class NewsModel {
  NewsModel({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.url,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        imagePath: json['urlToImage'],
        title: json['title'],
        description: json['description'],
        url: json['url']);
  }

  final String? imagePath;
  final String? title;
  final String? description;
  final String? url;
}
