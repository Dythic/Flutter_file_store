import 'package:flutter/material.dart';

class Product {
  final String image, title, description, country;
  final int price, size, id;
  final Color color;
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
    this.country,
  });

  Product.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      image = json['image'],
      title = json['title'],
      price = json['price'],
      description = json['description'],
      size = json['size'],
      color = Color(0xFFFFFFFF),
      country = json['country'];
  
  Map<String, dynamic> toJson() =>
  {
    'id': id,
    'image': image,
    'title': title,
    'price': price,
    'description': description,
    'size': size,
    'country': country,
  };
}

List<Product> products = [
  Product(
      id: 0,
      title: "IPhone 10",
      price: 675,
      size: 12,
      country: "France",
      description: dummyText,
      image: "assets/images/phone.jpg",
      color: Color(0xFFFFFFFF)),
  Product(
      id: 1,
      title: "MacBook Pro 2016",
      price: 1200,
      size: 8,
      country: "China",
      description: dummyText,
      image: "assets/images/mac.jpg",
      color: Color(0xFFFFFFFF)),
  Product(
      id: 2,
      title: "Samsung Tab A",
      price: 345,
      size: 10,
      country: "Russia",
      description: dummyText,
      image: "assets/images/tablette.jpg",
      color: Color(0xFFFFFFFF)),
  Product(
      id: 3,
      title: "Bose Qc35",
      price: 199,
      size: 11,
      country: "Allemagne",
      description: dummyText,
      image: "assets/images/casque.jpg",
      color: Color(0xFFFFFFFF)),
  Product(
      id: 4,
      title: "Canon 2000D",
      price: 499,
      size: 12,
      country: "Belgique",
      description: dummyText,
      image: "assets/images/camera.jpg",
      color: Color(0xFFFFFFFF)),
  Product(
      id: 5,
      title: "LG Electronics BX",
      price: 1600,
      size: 12,
      country: "Espagne",
      description: dummyText,
      image: "assets/images/tv.jpg",
      color: Color(0xFFFFFFFF)),
  Product(
      id: 6,
      title: "Xbox series X",
      price: 299,
      size: 12,
      country: "Italie",
      description: dummyText,
      image: "assets/images/console.jpg",
      color: Color(0xFFFFFFFF)),
  Product(
      id: 7,
      title: "MARSHALL Kilburn",
      price: 199,
      size: 12,
      country: "France",
      description: dummyText,
      image: "assets/images/enceinte.jpg",
      color: Color(0xFFFFFFFF)),
  Product(
      id: 8,
      title: "Bluestork MC-101",
      price: 9,
      size: 12,
      country: "France",
      description: dummyText,
      image: "assets/images/wireless headset.png",
      color: Color(0xFFFFFFFF)),
  Product(
      id: 9,
      title: "Nike Air Max Invigor",
      price: 39,
      size: 12,
      country: "China",
      description: dummyText,
      image: "assets/images/shoes2.png",
      color: Color(0xFFFFFFFF)),
  Product(
      id: 10,
      title: "Helmet Vtt St 500 ",
      price: 30,
      size: 12,
      country: "France",
      description: dummyText,
      image: "assets/images/Image Popular Product 3.png",
      color: Color(0xFFFFFFFF)),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
