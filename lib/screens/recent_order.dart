import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fooddelivery/models/order.dart';
import '../data/data.dart';
import '../models/food.dart';

import 'package:flutter/material.dart';
class RecentOrder extends StatelessWidget {
  const RecentOrder({Key? key}) : super(key: key);
  _buildRecentOrder(BuildContext context,Order order){
    return Container(
      margin: const EdgeInsets.all(10),
      width: 320,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 1.0,
          color: Color.fromARGB(233, 227, 225, 225),
        )

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, //spaceBetween là các item phân bổ cách đều nhau
        children: [
          Expanded(
            child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                  height: 98,
                  width: 98,
                  image: AssetImage(order.food.imgaeUrl),
                  fit: BoxFit.cover,

                ),
              ),
            ],),),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.food.name,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900
                    ),
                    // overflow: TextOverflow.ellipsis,
                    ),
                   SizedBox(height: 4),
                   Text(order.restaurant.name,style: TextStyle(
                     fontSize: 16,
                     fontWeight: FontWeight.w600
                   ),
                   overflow: TextOverflow.ellipsis,),
                   SizedBox(height: 4),
                   Text(order.date,style: TextStyle(
                     fontSize: 16,
                     fontWeight: FontWeight.w600
                   ),)
                  ],

                ),
              ),
              ),
              Container(
                margin: const EdgeInsets.only(right:10),
                width: 48,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: IconButton(icon: Icon(Icons.add),iconSize: 30,color: Colors.white,onPressed: (){},),
              ),

      ]),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20), //khoảng cách 2 đầu là padding 20
          child: Text(
            'Recent Order',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2 //khoảng cách giữa các chữ là 1.2
            ),
          ),
          ),
          Container(
            height: 120,
            child: ListView.builder(
              physics: BouncingScrollPhysics(), //cho phép list có thể scroll đc
              padding: const EdgeInsets.only(left:10),
              scrollDirection: Axis.horizontal, //scroll theo chiều ngang
              itemCount: currentUser.orders.length, //chiều dài mảng currenUser
              itemBuilder: (context,index){
                Order order = currentUser.orders[index];
                return _buildRecentOrder(context,order);

              }
              ),

          ),
      ],
    );
  }
}