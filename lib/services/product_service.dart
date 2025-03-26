import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:practicas_flutter/models/models.dart';
import 'package:http/http.dart' as http;

class ProductService extends ChangeNotifier {
  final String _baseUrl = 'flutter-varios-41a40-default-rtdb.europe-west1.firebasedatabase.app';
  final List<Product> products = [];
  late Product selectedProduct;
  bool isLoading = true;
  bool isSaving = false;

  ProductService() {
    this.loadProducts();
  }

  //Future<List<Product>>
  Future<List<Product>> loadProducts() async {
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(resp.body);

    productsMap.forEach((key, value){
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      this.products.add(tempProduct);
    });

    this.isLoading = false;
    notifyListeners();


    return this.products;
  }


  Future saveOrCreateProduct(Product p) async {
    isSaving = true;
    notifyListeners();

    if(p.id == null){

    }
    else {
      updateProduct(p);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Product p) async {
    final url = Uri.https(_baseUrl, 'products/${p.id}.json');
    final resp = await http.put(url, body: p.toJson());
    final decodeData = resp.body;

    //var oldPr = products.where((pr) => pr.id == p.id);

    /*for (Product pr in products){
      if (pr.id == p.id){
        pr = p;
        break;
      }
    }*/

    final index = products.indexWhere((pr) => pr.id == p.id);
    products[index] = p;
    notifyListeners();

    return p.id!;
  }
}