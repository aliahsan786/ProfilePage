// ignore_for_file: prefer_final_fields, file_names
class Menu {
  final String id;
  final String title;
  final String imageUrl;
  final double price;
  final String description;
  final List<String> categories;
  bool favorite;
  Menu({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.description,
    required this.categories,
    this.favorite = false,
  });
}
