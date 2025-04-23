import 'package:boo/models/rating_model.dart';
import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int id;
  final String title;
  final String image;
  final num price;
  final String description;
  final String category;
  final RatingModel rating;

  const ProductModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
    required this.category,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      rating: RatingModel.fromJson(json['rating']),
    );
  }
  
Map<String,dynamic> toJson(){
  return {
    'id': id,
    'title': title,
    'image': image,
    'price': price,
    'description': description,
    'category': category,
    'rating': rating.toJson(),
  };
}
  @override
  List<Object?> get props =>
      [id, title, image, price, description, category, rating];
}
