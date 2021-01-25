class NewsHighLightModel {
  NewsHighLightModel({
    this.data,
  });

  final List<NewsHighLight> data;

  factory NewsHighLightModel.fromJson(Map<String, dynamic> json) => NewsHighLightModel(
        data:
            json["data"] == null ? null : List<NewsHighLight>.from(json["data"].map((x) => NewsHighLight.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class NewsHighLight {
  NewsHighLight({
    this.title,
    this.description,
    this.content,
    this.author,
    this.publishedAt,
    this.highlight,
    this.url,
    this.imageUrl,
  });

  final String title;
  final String description;
  final String content;
  final String author;
  final DateTime publishedAt;
  final bool highlight;
  final String url;
  final String imageUrl;

  factory NewsHighLight.fromJson(Map<String, dynamic> json) => NewsHighLight(
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        content: json["content"] == null ? null : json["content"],
        author: json["author"] == null ? null : json["author"],
        publishedAt: json["published_at"] == null ? null : DateTime.parse(json["published_at"]),
        highlight: json["highlight"] == null ? null : json["highlight"],
        url: json["url"] == null ? null : json["url"],
        imageUrl: json["image_url"] == null ? null : json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "content": content == null ? null : content,
        "author": author == null ? null : author,
        "published_at": publishedAt == null ? null : publishedAt.toIso8601String(),
        "highlight": highlight == null ? null : highlight,
        "url": url == null ? null : url,
        "image_url": imageUrl == null ? null : imageUrl,
      };
}
