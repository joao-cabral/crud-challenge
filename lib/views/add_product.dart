import 'package:crud_challenge/models/product_model.dart';
import 'package:crud_challenge/provider/products.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget{
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadForm(Product product){
    if(product != null){
      _formData['id'] = product.id;
      _formData['name'] = product.name;
      _formData['value'] = product.value;
      _formData['image'] = product.image;
    }
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final Product product = ModalRoute.of(context).settings.arguments;
    _loadForm(product);
  }

  @override
  Widget build(BuildContext context){
    final Product product = ModalRoute.of(context).settings.arguments;
    _loadForm(product);

    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Produto'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: InputDecoration(labelText: 'Nome'),
                onSaved: (value) => _formData['name'] = value, 
              ),
              TextFormField(
                initialValue: _formData['value'],
                decoration: InputDecoration(labelText: 'Valor'),
                keyboardType: TextInputType.number,
                inputFormatters: [CurrencyTextInputFormatter()],
                onSaved: (value) => _formData['value'] = value,
              ),
              TextFormField(
                initialValue: _formData['image'],
                decoration: InputDecoration(labelText: 'Imagem URL'),
                onSaved: (value) => _formData['image'] = value,
              ),
            ],
          ),
        ),  
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          _form.currentState.save();
          Provider.of<Products>(context, listen: false).put(
            Product(
              id: _formData['id'],
              name: _formData['name'],
              value: _formData['value'],
              image: _formData['image'],
            )
          );
          Navigator.of(context).pop();
        },
      ),
    );
  }
}