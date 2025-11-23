class Product {
  final int id;
  final String name;
  final String imagePath;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
  });
}

class Productmodel {
  final List<Product> Products;

  Productmodel({required this.Products});
  factory Productmodel.fromJson({required List json}) {
    List<Product> temp = json.map((pro) {
      return Product(
        id: pro["id"],
        name: pro["name"],
        imagePath: pro["imagePath"],
        price: pro["price"],
      );
    }).toList();
    return Productmodel(Products: temp);
  }
}
