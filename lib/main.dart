import 'package:crud_challenge/provider/products.dart';
import 'package:crud_challenge/routes/routes.dart';
import 'package:crud_challenge/views/add_product.dart';
import 'package:crud_challenge/views/list_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CRUD Challenge',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          Routes.HOME: (_) => ProductsList(),
          Routes.ADD_PRODUCT: (_) => AddProduct(),
        },
      ),
    );
  }
}
