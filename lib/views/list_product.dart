import 'package:crud_challenge/components/user_tile.dart';
import 'package:crud_challenge/provider/products.dart';
import 'package:crud_challenge/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsList extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final Products products = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de produtos"),
      ),
      body: ListView.builder(
        itemCount: products.count,
        itemBuilder: (context, index) => ProductTile(products.byIndex(index)),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed(Routes.ADD_PRODUCT)
      ),
    );
  }
}