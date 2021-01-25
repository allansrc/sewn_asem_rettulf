class NewsModel {
  NewsModel({
    this.pagination,
    this.data,
  });

  final Pagination pagination;
  final List<NewsData> data;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
        data: json["data"] == null ? null : List<NewsData>.from(json["data"].map((x) => NewsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination == null ? null : pagination.toJson(),
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class NewsData {
  NewsData({
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

  factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
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

class Pagination {
  Pagination({
    this.currentPage,
    this.perPage,
    this.totalPages,
    this.totalItems,
  });

  final int currentPage;
  final int perPage;
  final int totalPages;
  final int totalItems;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        currentPage: json["current_page"] == null ? null : json["current_page"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
        totalItems: json["total_items"] == null ? null : json["total_items"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage == null ? null : currentPage,
        "per_page": perPage == null ? null : perPage,
        "total_pages": totalPages == null ? null : totalPages,
        "total_items": totalItems == null ? null : totalItems,
      };
}
