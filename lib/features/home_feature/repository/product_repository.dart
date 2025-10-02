import 'package:ecommerce_app/features/home_feature/model/product_model.dart';

class ProductRepository {
  // Changed from a method (getProducts()) to a static list (getProducts)
  // so we can access the products directly without calling a function.
  static List<ProductModel> getProducts = [
      ProductModel(
        id: "1",
        name: "Black Backpack",
        imageUrl: "assets/images/products/Black_Backpack.png",
        price: 1200,
        rating: 4.6,
        manufacturer: "Zara",
        description:
            "A stylish and practical black leather backpack with a modern design, perfect for work, travel, and daily use.",
      ),
      ProductModel(
        id: "2",
        name: "Blue Tote Bag",
        imageUrl: "assets/images/products/Blue_Tote_Bag.png",
        price: 950,
        rating: 4.3,
        manufacturer: "H&M",
        description:
            "Spacious and versatile tote bag with elegant blue accents, ideal for shopping and everyday activities.",
      ),
      ProductModel(
        id: "3",
        name: "Crossbody Backpack",
        imageUrl: "assets/images/products/Crossbody_Backpack.png",
        price: 800,
        rating: 4.1,
        manufacturer: "Pull&Bear",
        description:
            "Lightweight and compact crossbody backpack with a trendy design, perfect for short trips and casual outings.",
      ),
      ProductModel(
        id: "4",
        name: "Brown Leather Bags Set",
        imageUrl: "assets/images/products/Brown_Leather_Bags_Set.png",
        price: 1500,
        rating: 4.8,
        manufacturer: "Mango",
        description:
            "Premium brown leather bag set including tote, wallet, and pouch. Perfect for formal occasions and daily use.",
      ),
      ProductModel(
        id: "5",
        name: "Purple Shoulder Bag",
        imageUrl: "assets/images/products/Purple_Shoulder_Bag.png",
        price: 700,
        rating: 4.0,
        manufacturer: "Bershka",
        description:
            "Trendy purple padded shoulder bag with a unique design, perfect for adding a bold touch to your outfit.",
      ),
      ProductModel(
        id: "6",
        name: "Black Jeans",
        imageUrl: "assets/images/products/Black_Jeans.png",
        price: 550,
        rating: 4.2,
        manufacturer: "Zara",
        description:
            "Classic black denim jeans with a slim fit cut, designed for comfort and effortless style.",
      ),
      ProductModel(
        id: "7",
        name: "Brown Jacket",
        imageUrl: "assets/images/products/Brown_Jacket.png",
        price: 900,
        rating: 4.5,
        manufacturer: "H&M",
        description:
            "Stylish brown casual jacket made of high-quality cotton blend fabric, perfect for everyday wear.",
      ),
      ProductModel(
        id: "8",
        name: "Black Denim Jacket",
        imageUrl: "assets/images/products/Black_Denim_Jacket.png",
        price: 850,
        rating: 4.4,
        manufacturer: "Pull&Bear",
        description:
            "Classic black denim jacket with a modern slim fit, designed for versatile styling and layering.",
      ),
      ProductModel(
        id: "9",
        name: "Blue Jeans",
        imageUrl: "assets/images/products/Blue_Jeans.png",
        price: 650,
        rating: 4.3,
        manufacturer: "Zara",
        description:
            "Comfortable light blue washed jeans with a trendy faded effect, perfect for casual daily looks.",
      ),
      ProductModel(
        id: "10",
        name: "Floral White Dress",
        imageUrl: "assets/images/products/Floral_White_Dress.png",
        price: 1400,
        rating: 4.7,
        manufacturer: "Mango",
        description:
            "Elegant white midi dress with blue floral prints, perfect for summer outings and special occasions.",
      ),
    ];
  
}
