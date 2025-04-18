import 'package:flutter/material.dart';
import '../../controllers/product_controller.dart';
import '../../models/product.dart';
import 'product_registration_screen.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductController _productController = ProductController();

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    await _productController.loadProducts();
    setState(() {});
  }

  void _deleteProduct(int id) async {
    _productController.deleteProduct(id);
    await _loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Produtos')),
      body: ListView.builder(
        itemCount: _productController.products.length,
        itemBuilder: (context, index) {
          final product = _productController.products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('Preço: R\$ ${product.salePrice} | Estoque: ${product.stockQuantity}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductRegistrationScreen(existingProduct: product),
                      ),
                    ).then((_) => _loadProducts());
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteProduct(product.id),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductRegistrationScreen()),
          ).then((_) => _loadProducts());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
