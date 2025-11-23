import 'package:e_comrcee_with_api_with_gad/Models/ProductModel.dart';

class Cartmodel {
  final List<Product> products;
   double totalPrice;

  Cartmodel({required this.products,  this.totalPrice = 0});
  factory Cartmodel.fromJson(Map<String,dynamic> json)
  {
    List<Product> temp = json["products"].map<Product>((pro)
    {
      return Product(
        id: pro["id"],
        name: pro["name"],
        imagePath: pro["imagePath"],
        price: pro["price"],
      );
    }).toList();
    return Cartmodel(products: temp, totalPrice: json["totalPrice"]);
  }
}