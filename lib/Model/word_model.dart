class wordModel {
  final String? id;
  final String folderId;
  final String english;
  final String? exampleEnglish;
  final String vietnamese;
  final String? exampleVietnamese;
  final String interval;
  final bool isDueToDay;
  wordModel({
    this.id,
    required this.folderId,
    required this.english,
    this.exampleEnglish,
    required this.vietnamese,
    this.exampleVietnamese,
    this.interval = "3",
    this.isDueToDay = true,
  });
  factory wordModel.fromJson(Map<String, dynamic> json) {
    print("json: $json");
    return wordModel(
      id: json["id"] ?? json["_id"] ?? "",
      folderId: json["folderId"] ?? "",
      english: json["english"] ?? "",
      exampleEnglish: json["exampleEnglish"],
      vietnamese: json["vietnamese"] ?? "",
      exampleVietnamese: json["exampleVietnamese"],
      interval: json["interval"] ?? "3 giờ",
      isDueToDay: json["isDueToday"] ?? true,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "folderId": folderId,
      "english": english,
      "exampleEnglish": exampleEnglish,
      "vietnamese": vietnamese,
      "exampleVietnamese": exampleVietnamese,
      "interval": interval,
      "isDueToDay": isDueToDay,
  };
}
}
