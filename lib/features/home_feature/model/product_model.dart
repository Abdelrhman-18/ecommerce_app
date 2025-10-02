class ProductModel {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final double rating;
  final String manufacturer;
  final String description;
  final bool isFavorite;

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

  ProductModel copyWith({
    String? id,
    String? name,
    String? imageUrl,
    double? price,
    double? rating,
    String? manufacturer,
    String? description,
    bool? isFavorite,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      manufacturer: manufacturer ?? this.manufacturer,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
enum ProductSize{
  S,
  M,
  L ,
  XL ,
}