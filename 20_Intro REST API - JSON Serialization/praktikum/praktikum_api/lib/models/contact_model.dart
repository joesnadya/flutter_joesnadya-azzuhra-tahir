class ContactModel {
  int id;
  String name;
  String phone;

  ContactModel({
    required this.id,
    required this.name,
    required this.phone,
  });

  // Metode factory untuk mengonversi data JSON menjadi objek ContactModel.
  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
  );

  // Metode untuk mengonversi objek ContactModel menjadi data JSON.
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
  };
}