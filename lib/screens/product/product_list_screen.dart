import 'package:flutter/material.dart';
import '../../controllers/product_controller.dart';
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
    _productController.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: ListView.builder(
        itemCount: _productController.products.length,
        itemBuilder: (context, index) {
          final product = _productController.products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('Price: ${product.salePrice} | Stock: ${product.stockQuantity}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Implement edit functionality
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _productController.deleteProduct(product.id);
                    setState(() {});
                  },
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
          ).then((_) => setState(() {}));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}