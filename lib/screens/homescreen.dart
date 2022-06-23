import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/models/restaurant.dart';
import 'package:fooddelivery/screens/restauran_screen.dart';
import 'package:fooddelivery/widgets/rating.dart';
import './recent_order.dart';
import '../data/data.dart';
import '../widgets/rating.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildRestaurant(){
    List<Widget> restaurantList = [];
    restaurant.forEach((Restaurant restaurants) {
     restaurantList.add(
         GestureDetector(    //?chưa biết
          onTap: () => Navigator.push(
            context, 
            MaterialPageRoute(builder: (_)=>RestaurantScreen(restaurants: restaurants))),
          child: Padding(
            padding: const EdgeInsets.only(top:10,bottom: 5),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 1,
                  color: Color.fromARGB(233, 227, 225, 225),
                ),
              ),
              child:Row(children: <Widget> [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    height: 115,
                    width: 115,
                    image: AssetImage(restaurants.imgaeUrl),
                    fit: BoxFit.cover,), 
      
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(restaurants.name,style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900
                        ),),
                        RatingStar(restaurants.rating),
                        SizedBox(height: 4),
                        Text(
                          restaurants.address,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600

                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4,),
                        Text('0.2 miles away',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),)

                      ]),
                  ),
                  ),
              ],)
            ),
          ),
        ),
      );

    });

    return Column(children: restaurantList);

  }
  @override
  Widget build(BuildContext context) {
    //  SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      
      appBar:AppBar(
        backgroundColor: Color.fromARGB(255, 8, 218, 159),
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          iconSize: 35,
          onPressed: (){},
        ),
        title: Text("Food Delivery"),
        centerTitle: true,
        actions: <Widget>[
          TextButton(onPressed: (){},
           child: Text("Cart(5)",
           style: TextStyle(
             color: Colors.white,
             fontSize: 20
           ),))
        ],
        
        
      ),
      body: ListView(
        children: [
          Padding(   
            padding: const EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(20),
                fillColor: Colors.white,
                filled: true,
                
                hintText: 'Search food or restaurant',
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  width: 0.8,
                  color: Theme.of(context).primaryColor
                ), ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 0.8),
                ),
                prefixIcon: Icon(Icons.search, size: 30,),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: (){},
                ),
              ),
            ),
            ),
          RecentOrder(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('Nearby Restaurants',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5 //dãn chữ
                ),),
                ),
                _buildRestaurant()
            ],
          ),
        ],
      ),
    );
  }
}