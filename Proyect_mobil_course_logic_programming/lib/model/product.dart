class Product {
  final int id;
  final String code;
  final String name;
  final double price;

  Product({
    required this.id,
    required this.code,
    required this.name,
    required this.price,
  });

  static Product createEmpty() {
    return Product(
      id: 0,
      code: '',
      name: '',
      price: 0.0,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      code: json['productCode'],
      name: json['productName'],
      price: json['productPrice'].toDouble(),
    );
  }
}
