import 'package:crud_challenge/models/product_model.dart';
import 'package:crud_challenge/routes/routes.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget{
  
  final Product product;
  const ProductTile(this.product);

  @override
  Widget build(BuildContext context){
    final image = product.image == null || product.image.isEmpty
      ? CircleAvatar(child:  Icon(Icons.insert_emoticon)) 
      : CircleAvatar(backgroundImage: NetworkImage(product.image));

    return ListTile(
      leading: image,
      title: Text(product.name),
      subtitle: Text(product.value),
      trailing: Container(
        child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.edit), 
            onPressed: (){
              Navigator.of(context).pushNamed(
                Routes.ADD_PRODUCT,
                arguments: product,
              );
            }
          ),
          IconButton(
            icon: Icon(Icons.delete),
            color: Colors.red,
            onPressed: (){}
          ),
        ],
      ),
      )
    );
  }
}