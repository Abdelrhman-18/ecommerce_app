class ProductModel {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final double rating;
  final String manufacturer;
  final String description;
  bool isFavorite;

  ProductModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.manufacturer,
    required this.description,
    this.isFavorite = false,
  });
}
