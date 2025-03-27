import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:practicas_flutter/models/models.dart';
import 'package:http/http.dart' as http;

class ProductService extends ChangeNotifier {
  final String _baseUrl = 'flutter-varios-41a40-default-rtdb.europe-west1.firebasedatabase.app';
  final List<Product> products = [];
  late Product selectedProduct;
  bool isLoading = true;
  bool isSaving = false;
  File? newPictureFile;

  final storage = new FlutterSecureStorage();

  ProductService() {
    this.loadProducts();
  }

  //Future<List<Product>> tanosus@gmail.com
  Future<List<Product>> loadProducts() async {
    this.isLoading = true;
    notifyListeners();

    final token = await storage.read(key: 'token') ?? '';
    print('Token: $token');

    final url = Uri.https(_baseUrl, 'products.json', {
      'auth': await storage.read(key: 'token') ?? ''
    }); // aqui le paso el token 
    final resp = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(resp.body);

    productsMap.forEach((key, value){
      final tempProduct = Product.fromMap(value); // aunque le paso el token el value es "permission denied"
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
      createProduct(p);
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


    Future<String> createProduct(Product p) async {
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.post(url, body: p.toJson());
    final decodeData = json.decode(resp.body);

    p.id = decodeData['name'];
    products.add(p);

    notifyListeners();

    return p.id!;
  }


  void updateSelectedImage(String path){
    selectedProduct.picture = path;
    newPictureFile = File.fromUri(Uri(path: path));
    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if (newPictureFile == null) return null;

    isSaving = true;
    notifyListeners();

    final url = Uri.parse('https://api.cloudinary.com/v1_1/dztro4oul/image/upload?upload_preset=r4m37kab');
    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file = await http.MultipartFile.fromPath('file', newPictureFile!.path);
    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201){
      print('Algo salio mal :(');
      print(resp.body);
      return null;
    }
    
    newPictureFile = null;
    final decodedData = json.decode(resp.body);

    return decodedData['secure_url'];
  }
}