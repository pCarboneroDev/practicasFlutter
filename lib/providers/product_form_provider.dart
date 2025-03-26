import 'package:flutter/material.dart';
import 'package:practicas_flutter/models/models.dart';

class ProductFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Product product;

  // constructor
  ProductFormProvider(this.product);

  updateAvailability(bool value){
    this.product.available = value;
    notifyListeners();
  }


  bool isValidForm() {
    print(product.name);
    print(product.price);
    print(product.available);
    return formKey.currentState?.validate() ?? false;
  } 
}