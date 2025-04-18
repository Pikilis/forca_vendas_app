import 'package:flutter/material.dart';
import '../../controllers/product_controller.dart';
import '../../models/product.dart';

class ProductRegistrationScreen extends StatefulWidget {
  final Product? existingProduct;

  ProductRegistrationScreen({this.existingProduct});

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

  bool _isEditMode = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await _productController.loadProducts();

    if (widget.existingProduct != null) {
      final product = widget.existingProduct!;
      _isEditMode = true;

      _idController.text = product.id.toString();
      _nameController.text = product.name;
      _unitController.text = product.unit;
      _stockQuantityController.text = product.stockQuantity.toString();
      _salePriceController.text = product.salePrice.toString();
      _statusController.text = product.status.toString();
      _costController.text = product.cost?.toString() ?? '';
      _barcodeController.text = product.barcode ?? '';
    } else {
      final nextId = _productController.products.isNotEmpty
          ? _productController.products.map((p) => p.id).reduce((a, b) => a > b ? a : b) + 1
          : 1;
      _idController.text = nextId.toString();
    }
    setState(() {});
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

      if (_isEditMode) {
        _productController.updateProduct(product.id, product);
      } else {
        _productController.addProduct(product);
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditMode ? 'Editar Produto' : 'Cadastrar Produto'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _idController,
                decoration: InputDecoration(labelText: 'ID'),
                validator: (value) => value!.isEmpty ? 'Informe o ID' : null,
                keyboardType: TextInputType.number,
                enabled: !_isEditMode,
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) => value!.isEmpty ? 'Informe o nome' : null,
              ),
              TextFormField(
                controller: _unitController,
                decoration: InputDecoration(labelText: 'Unidade (un, cx, kg, lt, ml)'),
                validator: (value) => value!.isEmpty || !['un', 'cx', 'kg', 'lt', 'ml'].contains(value)
                    ? 'Informe uma unidade válida'
                    : null,
              ),
              TextFormField(
                controller: _stockQuantityController,
                decoration: InputDecoration(labelText: 'Quantidade em Estoque'),
                validator: (value) => value!.isEmpty ? 'Informe a quantidade' : null,
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _salePriceController,
                decoration: InputDecoration(labelText: 'Preço de Venda'),
                validator: (value) => value!.isEmpty ? 'Informe o preço de venda' : null,
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _statusController,
                decoration: InputDecoration(labelText: 'Status (0 - Ativo / 1 - Inativo)'),
                validator: (value) =>
                    value!.isEmpty || !['0', '1'].contains(value)
                        ? 'Status deve ser 0 ou 1'
                        : null,
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _costController,
                decoration: InputDecoration(labelText: 'Custo'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _barcodeController,
                decoration: InputDecoration(labelText: 'Código de Barras'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProduct,
                child: Text(_isEditMode ? 'Atualizar' : 'Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
