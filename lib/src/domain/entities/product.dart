class Product {
  final String name;
  final double price;
  final int stock;
  String? id;

  Product({
    required this.name, 
    required this.price, 
    required this.stock,
    this.id,
  });

  Product.fromJson(Map<String, dynamic> data): 
    name = data['name'],
    price = data['price'].toDouble(),
    stock = data['stock'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'stock': stock
    };
  }

   Product copy() => Product(
      name: name,
      price: price,
      stock: stock,
    );

}