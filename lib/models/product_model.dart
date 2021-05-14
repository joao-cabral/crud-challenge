import 'package:flutter/cupertino.dart';

class Product {
  final String id;
  final String name;
  final String value;
  final String image;

  const Product({
    this.id, 
    @required this.name, 
    @required this.value, 
    @required this.image
  });
 
//  Map<String, dynamic> toMap() {
//    var map = <String, dynamic>{
//      'id': id,
//      'name': name,
//    };
//    return map;
//  }
}