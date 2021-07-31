class Category {
  int id;
  String nama;

  Category({required this.id, required this.nama});

  factory Category.fromJson(Map<String, dynamic> responseData) {
    return Category(
      id: responseData['id'],
      nama: responseData['nama'] ?? '',
    );
  }
}
