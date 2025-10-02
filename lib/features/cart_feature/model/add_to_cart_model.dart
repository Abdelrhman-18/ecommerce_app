import 'package:ecommerce_app/features/home_feature/model/product_model.dart';

class AddToCartModel {
  final String productId;
  final ProductSize size;
  final int quantity;
  final double price;
  final String imageUrl;
  final String name;

  const AddToCartModel({
    required this.productId,
    required this.size,
    required this.quantity,
    required this.price,
    required this.imageUrl,
    required this.name,
  });
 double get totalPrice => price * quantity;
  // copyWith method
  AddToCartModel copyWith({
    String? productId,
    ProductSize? size,
    int? quantity,
    double? price,
    String? imageUrl,
    String? name,
  }) {
    return AddToCartModel(
      productId: productId ?? this.productId,
      size: size ?? this.size,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
    );
  }


}

List<AddToCartModel> dummyCart = [];
