import './food.dart';
import './restaurant.dart';

class Order{
  final String date;
  final Food food;
  final Restaurant restaurant;
  final int quantity;

  Order({
    required this.restaurant,
    required this.food,
    required this.date,
    required this.quantity
  });
}