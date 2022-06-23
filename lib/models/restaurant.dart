import './food.dart';

class Restaurant{
  final String imgaeUrl;
  final String name;
  final String address;
  final int rating;
  final List<Food> menu;

  Restaurant({
    required this.imgaeUrl,
    required this.name,
    required this.address,
    required this.rating,
    required this.menu
  });
}