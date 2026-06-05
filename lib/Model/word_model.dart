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
}
