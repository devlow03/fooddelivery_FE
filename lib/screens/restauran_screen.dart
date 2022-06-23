import 'package:flutter/material.dart';
import 'package:fooddelivery/models/food.dart';
import 'package:fooddelivery/models/restaurant.dart';
import 'package:fooddelivery/screens/homescreen.dart';
import 'package:fooddelivery/widgets/rating.dart';
import '../data/data.dart';

class RestaurantScreen extends StatefulWidget {
  
  final Restaurant restaurants;
  RestaurantScreen({ required this.restaurants});

  @override
  State <RestaurantScreen> createState() =>  _RestaurantScreenState();
}

class  _RestaurantScreenState extends State <RestaurantScreen> {
  _buildMenuItem(Food menu){
    return Center(
      child: Stack(alignment: Alignment.center,
      children: [
        Container(
          height: 175,
          width: 175,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(menu.imgaeUrl),
            fit: BoxFit.cover
            ),
            borderRadius: BorderRadius.circular(15)
          ),
        ),
        Container(
          height: 175,
          width: 175,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient:LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.topLeft,
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.black87.withOpacity(0.3),
                Colors.black54.withOpacity(0.3),
                Colors.black38.withOpacity(0.3)
              ]
            )
          ),
        ),
        Positioned(
          bottom: 65,
          child: Column(children: [
            Text(
              menu.name,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2
              ),
            ),
             Text(
              '\$${menu.price}',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2
              ),
            ),
          ]),
        ),
        
      ],),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Stack(
          children: [
            Hero(tag: widget.restaurants.imgaeUrl, 
            child: Image(image: AssetImage(widget.restaurants.imgaeUrl),
              height: 220,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover
            ,)),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){
                    Navigator.pushAndRemoveUntil(context,
                     MaterialPageRoute(builder: (_)=>HomeScreen()),
                     (route) => false);
                  }, 
                  icon: Icon(Icons.arrow_back_ios),
                  iconSize: 30,
                  color: Colors.white,),

                  IconButton(onPressed: (){}, 
                  icon: Icon(Icons.favorite),
                  iconSize: 35,
                  color: Color.fromARGB(255, 231, 4, 4),

                  ),

              ]),

            ),

          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.restaurants.name,style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600
              ),),
              Text('0.2 miles away',
              style: TextStyle(fontSize: 18),),
            
              
                ],
              ),
              // SizedBox(height: ,),
                RatingStar(widget.restaurants.rating),
                SizedBox(height: 6,),
                Text(widget.restaurants.address,
                style: TextStyle(fontSize: 18),)
            ],
          ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: (){}, 
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  textStyle: TextStyle(color: Theme.of(context).primaryColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                child: Text('Review',style: TextStyle(color: Colors.black,fontSize: 20),)),
                  TextButton(
                onPressed: (){}, 
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  textStyle: TextStyle(color: Theme.of(context).primaryColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                child: Text('Contact',style: TextStyle(color: Colors.black,fontSize: 20),)),
            ],
          ),
          SizedBox(height: 10,),
          Center(
            child: Text('Menu',style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              letterSpacing: 2
            ),),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(widget.restaurants.menu.length, (index){
                Food food = widget.restaurants.menu[index];
                return _buildMenuItem(food);
              }),
              )),
      ]),
    );
    
  }
}