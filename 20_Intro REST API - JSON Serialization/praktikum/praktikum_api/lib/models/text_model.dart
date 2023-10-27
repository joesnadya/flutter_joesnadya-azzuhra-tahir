class TextModel {
  int id;
  String title;
  String body;
  int userId;

  TextModel({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  // Metode factory untuk mengonversi data JSON menjadi objek TextModel.
  factory TextModel.fromJson(Map<String, dynamic> json) => TextModel(
    id: json["id"],
    title: json["title"],
    body: json["body"],
    userId: json["userId"]
  );

  // Metode untuk mengonversi objek TextModel menjadi data JSON.
  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "body": body,
    "userId": userId
  };
}