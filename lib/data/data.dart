import '../models/food.dart';
import '../models/restaurant.dart';
import '../models/order.dart';
import '../models/user.dart';


//food
final _burrito = Food(imgaeUrl: 'assets/images/burrito.jpg', name: 'Burrito', price: 8.99);
final _steak = Food(imgaeUrl: 'assets/images/steak.jpg', name: 'Steak', price: 17.99);
final _pasta = Food(imgaeUrl: 'assets/images/pasta.jpg', name: 'Pasta', price: 14.99);
final _ramen = Food(imgaeUrl: 'assets/images/ramen.jpg', name: 'Ramen', price: 13.99);
final _pancakes = Food(imgaeUrl: 'assets/images/pancakes.jpg', name: 'Pancakes', price: 9.99);
final _burger = Food(imgaeUrl: 'assets/images/burger.jpg', name: 'Burger', price: 14.99);
final _pizza = Food(imgaeUrl: 'assets/images/pizza.jpg', name: 'Pizza', price: 20.99);
final _salmon = Food(imgaeUrl: 'assets/images/salmon.jpg', name: 'Salmon salad', price: 12.99);

//Restaurant

final _restaurant0 = Restaurant(
  imgaeUrl: 'assets/images/restaurant0.jpg',
  name: 'Restaurant 0',
  address: '100 Main St ,NewYork, NY',
  rating: 5,
  menu: [_burrito,_steak,_pasta,_ramen,_pancakes,_pizza,_burger,_salmon]
);

final _restaurant1 = Restaurant(
  imgaeUrl: 'assets/images/restaurant1.jpg',
  name: 'Restaurant 1',
  address: '100 Main St ,NewYork, NY',
  rating: 4,
  menu: [_steak,_pasta,_ramen,_pancakes,_burger,_pizza]
);

final _restaurant2 = Restaurant(
  imgaeUrl: 'assets/images/restaurant2.jpg',
  name: 'Restaurant 2',
  address: '100 Main St ,NewYork, NY',
  rating: 4,
 menu: [_steak,_pasta,_pancakes,_burger,_pizza,_salmon]
);

final _restaurant3 = Restaurant(
  imgaeUrl: 'assets/images/restaurant3.jpg',
  name: 'Restaurant 3',
  address: '100 Main St ,NewYork, NY',
  rating: 2,
  menu: [_burrito,_steak,_burger,_pizza,_salmon]
);
final _restaurant4 = Restaurant(
  imgaeUrl: 'assets/images/restaurant4.jpg',
  name: 'Restaurant 4',
  address: '100 Main St ,NewYork, NY',
  rating: 3,
  menu: [_burrito,_ramen,_pancakes,_salmon]
);

//tạo list nhà hàng
final List<Restaurant> restaurant =[
  _restaurant0,
  _restaurant1,
  _restaurant2,
  _restaurant3,
  _restaurant4
];

final currentUser = User(
  name: 'Thien',
  orders: [
    Order(
      date: 'Nov 10,2019',
      food: _steak,
      restaurant: _restaurant2,
      quantity: 1
    ),
    Order(
      date: 'Nov 8,2019',
      food: _ramen,
      restaurant: _restaurant0,
      quantity: 3
    ),
    Order(
      date: 'Nov 2,2019',
      food: _salmon,
      restaurant: _restaurant3,
      quantity: 1
    ),
    Order(
      date: 'Nov 1,2019',
      food: _pancakes,
      restaurant: _restaurant4,
      quantity: 1
    )

  ],
  cart: [
   Order(
      date: 'Nov 11,2019',
      food: _burger,
      restaurant: _restaurant2,
      quantity: 1
    ),
    Order(
      date: 'Nov 11,2019',
      food: _pasta,
      restaurant: _restaurant2,
      quantity: 1
    ),
    Order(
      date: 'Nov 11,2019',
      food: _pancakes,
      restaurant: _restaurant4,
      quantity: 3
    ),
    Order(
      date: 'Nov 11,2019',
      food: _burrito,
      restaurant: _restaurant1,
      quantity: 2
    )
  ]
);

