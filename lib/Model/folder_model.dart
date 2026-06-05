class folderModel {
  final String? id;
  final String title;
  final int totalWords;
  final int maxWords;

  folderModel({
    required this.id,
    required this.title,
    required this.totalWords,
    required this.maxWords,
  });
  factory folderModel.fromJson(Map<String, dynamic> json) {
    return folderModel(
      // Giữ nguyên id và title
      id: json["id"] ?? json["_id"] ?? "",
      title: json["title"] ?? "Chưa có tên",
      totalWords: json["total_words"] ?? json["totalWords"] ?? 0,
      maxWords: json["max_words"] ?? json["maxWords"] ?? 0,
    );
  }
}
