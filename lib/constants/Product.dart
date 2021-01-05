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
}

List<Product> products = [
  Product(
      id: 0,
      title: "Phone",
      price: 234,
      size: 12,
      country: "France",
      description: dummyText,
      image: "assets/images/phone.jpg",
      color: Color(0xFFFFFFFF)),
  Product(
      id: 1,
      title: "Laptop",
      price: 234,
      size: 8,
      country: "France",
      description: dummyText,
      image: "assets/images/mac.jpg",
      color: Color(0xFFFFFFFF)),
  Product(
      id: 2,
      title: "Tablet",
      price: 234,
      size: 10,
      country: "France",
      description: dummyText,
      image: "assets/images/tablette.jpg",
      color: Color(0xFFFFFFFF)),
  Product(
      id: 3,
      title: "Headset",
      price: 234,
      size: 11,
      country: "France",
      description: dummyText,
      image: "assets/images/casque.jpg",
      color: Color(0xFFFFFFFF)),
  Product(
      id: 4,
      title: "Camera",
      price: 234,
      size: 12,
      country: "France",
      description: dummyText,
      image: "assets/images/camera.jpg",
      color: Color(0xFFFFFFFF)),
  Product(
      id: 5,
      title: "Tv",
      price: 234,
      size: 12,
      country: "France",
      description: dummyText,
      image: "assets/images/tv.jpg",
      color: Color(0xFFFFFFFF)),
  Product(
      id: 6,
      title: "Console",
      price: 234,
      size: 12,
      country: "France",
      description: dummyText,
      image: "assets/images/console.jpg",
      color: Color(0xFFFFFFFF)),
  Product(
      id: 7,
      title: "Enceinte",
      price: 234,
      size: 12,
      country: "France",
      description: dummyText,
      image: "assets/images/enceinte.jpg",
      color: Color(0xFFFFFFFF)),
  Product(
      id: 8,
      title: "Headset",
      price: 20,
      size: 12,
      country: "France",
      description: dummyText,
      image: "assets/images/wireless headset.png",
      color: Color(0xFFFFFFFF)),
  Product(
      id: 9,
      title: "Shoes",
      price: 45,
      size: 12,
      country: "China",
      description: dummyText,
      image: "assets/images/shoes2.png",
      color: Color(0xFFFFFFFF)),
  Product(
      id: 10,
      title: "Helmet",
      price: 67,
      size: 12,
      country: "France",
      description: dummyText,
      image: "assets/images/Image Popular Product 3.png",
      color: Color(0xFFFFFFFF)),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
