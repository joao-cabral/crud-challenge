import 'package:crud_challenge/models/product_model.dart';
import 'package:crud_challenge/provider/products.dart';
import 'package:crud_challenge/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget{
  
  final Product product;
  const ProductTile(this.product);

  @override
  Widget build(BuildContext context){
    final image = product.image == null || product.image.isEmpty
      ? CircleAvatar(child: Icon(Icons.insert_emoticon)) 
      : CircleAvatar(backgroundImage: NetworkImage(product.image));

    return ListTile(
      leading: image,
      title: Text(product.name),
      subtitle: Text(product.value),
      trailing: Container(
        width: 100,
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
            onPressed: (){
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Excluir Produto'),
                  content: Text('Comfirmar?'),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      }, 
                      child: Text('Não')
                    ),
                    FlatButton(
                      onPressed: () {
                        Provider.of<Products>(context, listen: false).remove(product);
                        Navigator.of(context).pop();
                      }, 
                      child: Text('Sim'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      )
    );
  }
}