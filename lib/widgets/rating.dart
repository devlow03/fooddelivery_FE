import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/src/foundation/key.dart';

import '../data/data.dart';
import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {

 
  final int rating;
  RatingStar(this.rating);


  
  @override
  Widget build(BuildContext context) {
  String star = '';
  for(int i = 0; i < rating;i++){
    star+='⭐';
  }
  star.trim();

  return Text(
    star,
    style: TextStyle(fontSize: 18),
  );
    
  }
}