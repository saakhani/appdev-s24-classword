import 'dart:ffi';

class Product {
  final String imageUrl;
  final String name;
  final double price;

  Product({required this.imageUrl, required this.name, required this.price});
}

List<Product> mockProducts = [
  Product(imageUrl: "imageUrl", name: "Vagabond", price: 120.00),
  Product(imageUrl: "imageUrl", name: "name", price: 0.00),
  Product(imageUrl: "imageUrl", name: "name", price: 0.00),
  Product(imageUrl: "imageUrl", name: "name", price: 0.00),
  Product(imageUrl: "imageUrl", name: "name", price: 0.00),
  Product(imageUrl: "imageUrl", name: "name", price: 0.00),
  Product(imageUrl: "imageUrl", name: "name", price: 0.00),
  Product(imageUrl: "imageUrl", name: "name", price: 0.00),
  Product(imageUrl: "imageUrl", name: "name", price: 0.00),
];
