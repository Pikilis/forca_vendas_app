class Product {
  int id;
  String name;
  String unit;
  int stockQuantity;
  double salePrice;
  int status; // 0 - Active / 1 - Inactive
  double? cost;
  String? barcode;

  Product({
    required this.id,
    required this.name,
    required this.unit,
    required this.stockQuantity,
    required this.salePrice,
    required this.status,
    this.cost,
    this.barcode,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'unit': unit,
        'stockQuantity': stockQuantity,
        'salePrice': salePrice,
        'status': status,
        'cost': cost,
        'barcode': barcode,
      };

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        unit: json['unit'],
        stockQuantity: json['stockQuantity'],
        salePrice: json['salePrice'],
        status: json['status'],
        cost: json['cost'],
        barcode: json['barcode'],
      );
}