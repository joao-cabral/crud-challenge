import 'dart:math';
import 'package:crud_challenge/data/mock_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:crud_challenge/models/product_model.dart';

class Products with ChangeNotifier{
  final Map<String, Product> _items = {...MOCK_PRODUCTS};

  List<Product> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Product byIndex(int index){
    return _items.values.elementAt(index);
  }

  void put(Product product){
    if(product == null){
      return;
    }

    if(_items.containsKey(product.id) && product.id != null){
      _items.update(
        product.id, 
        (_) => Product(
          id: product.id,
          name: product.name,
          value: product.value,
          image: product.image,  
        ) 
      );
    }else{
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(id, 
      () => Product(
        id: id,
        name: product.name,
        value: product.value,
        image: product.image,  
      ),
      );
    }
    notifyListeners();
  }
  
  void remove(Product product){
    if(product != null){
      _items.remove(product.id);
      notifyListeners();
    }
  }

}