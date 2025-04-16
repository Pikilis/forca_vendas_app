import 'package:flutter/material.dart';
import '../../controllers/product_controller.dart';
import '../../models/product.dart';

class ProductRegistrationScreen extends StatefulWidget {
  @override
  _ProductRegistrationScreenState createState() => _ProductRegistrationScreenState();
}

class _ProductRegistrationScreenState extends State<ProductRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _unitController = TextEditingController();
  final _stockQuantityController = TextEditingController();
  final _salePriceController = TextEditingController();
  final _statusController = TextEditingController();
  final _costController = TextEditingController();
  final _barcodeController = TextEditingController();
  final ProductController _productController = ProductController();

  @override
  void initState() {
    super.initState();
    _productController.loadProducts();
  }

  void _saveProduct() {
    if (_formKey.currentState!.validate()) {
      final product = Product(
        id: int.parse(_idController.text),
        name: _nameController.text,
        unit: _unitController.text,
        stockQuantity: int.parse(_stockQuantityController.text),
        salePrice: double.parse(_salePriceController.text),
        status: int.parse(_statusController.text),
        cost: _costController.text.isEmpty ? null : double.parse(_costController.text),
        barcode: _barcodeController.text.isEmpty ? null : _barcodeController.text,
      );
      _productController.addProduct(product);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register Product')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _idController,
                decoration: InputDecoration(labelText: 'ID'),
                validator: (value) =>
                    value!.isEmpty ? 'ID is required' : null,
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) =>
                    value!.isEmpty ? 'Name is required' : null,
              ),
              TextFormField(
                controller: _unitController,
                decoration: InputDecoration(labelText: 'Unit (un, cx, kg, lt, ml)'),
                validator: (value) =>
                    value!.isEmpty || !['un', 'cx', 'kg', 'lt', 'ml'].contains(value)
                        ? 'Valid unit is required'
                        : null,
              ),
              TextFormField(
                controller: _stockQuantityController,
                decoration: InputDecoration(labelText: 'Stock Quantity'),
                validator: (value) =>
                    value!.isEmpty ? 'Stock Quantity is required' : null,
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _salePriceController,
                decoration: InputDecoration(labelText: 'Sale Price'),
                validator: (value) =>
                    value!.isEmpty ? 'Sale Price is required' : null,
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _statusController,
                decoration: InputDecoration(labelText: 'Status (0 - Active / 1 - Inactive)'),
                validator: (value) =>
                    value!.isEmpty || !['0', '1'].contains(value)
                        ? 'Status must be 0 or 1'
                        : null,
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _costController,
                decoration: InputDecoration(labelText: 'Cost'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _barcodeController,
                decoration: InputDecoration(labelText: 'Barcode'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProduct,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}