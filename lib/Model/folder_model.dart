class folderModel {
  final String? id;
  final String title;
  final String? description;
  final int totalWords;
  final int maxWords;
  final String userId;

  folderModel({
    required this.userId,
    required this.id,
    required this.title,
    this.description,
    required this.totalWords,
    required this.maxWords,
  });
  factory folderModel.fromJson(Map<String, dynamic> json) {
    return folderModel(
      // Giữ nguyên id và title
      userId:      json["userId"] ?? json["user_id"] ?? "",
      id: json["id"] ?? json["_id"] ?? "",
      title: json["title"] ?? "Chưa có tên",
      description: json["description"],
      totalWords: json["total_words"] ?? json["totalWords"] ?? 0,
      maxWords: json["max_words"] ?? json["maxWords"] ?? 0,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      // "userId":userId,
      "description": description,
      "totalWords": totalWords,
      "maxWords": maxWords,
    };
  }
}
