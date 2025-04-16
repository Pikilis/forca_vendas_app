import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/product.dart';

class ProductController {
  List<Product> products = [];

  Future<void> loadProducts() async {
    final file = await _getFile('products.json');
    if (await file.exists()) {
      final contents = await file.readAsString();
      final List<dynamic> json = jsonDecode(contents);
      products = json.map((e) => Product.fromJson(e)).toList();
    }
  }

  Future<void> saveProducts() async {
    final file = await _getFile('products.json');
    await file.writeAsString(jsonEncode(products));
  }

  void addProduct(Product product) {
    products.add(product);
    saveProducts();
  }

  void updateProduct(int id, Product updatedProduct) {
    final index = products.indexWhere((product) => product.id == id);
    if (index != -1) {
      products[index] = updatedProduct;
      saveProducts();
    }
  }

  void deleteProduct(int id) {
    products.removeWhere((product) => product.id == id);
    saveProducts();
  }

  Future<File> _getFile(String filename) async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$filename');
  }
}