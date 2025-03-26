import 'package:flutter/material.dart';
import 'package:practicas_flutter/services/services.dart';
import 'package:practicas_flutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import 'screens.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductService>(context);
    
    if (productService.isLoading) {
      return LoadingScreen();
    }

    return Scaffold(

      appBar: AppBar(
        title: Text('Productos App'),
      ),

      body: ListView.builder(
        itemCount: productService.products.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            productService.selectedProduct = productService.products[index].copy();
            Navigator.pushNamed(context, 'product');
          },
          child: ProductCard(product: productService.products[index],)
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          productService.selectedProduct = new Product(
            available: false, 
            name: '', 
            price: 0
          );
          Navigator.pushNamed(context, 'product');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}