import 'package:e_comrcee_with_api_with_gad/Models/ProductModel.dart';
import 'package:e_comrcee_with_api_with_gad/Providers/CartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Customproductitem extends StatelessWidget {
  Customproductitem({super.key, required this.product, required this.userId});
  final Product product;
  final int userId;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            product.imagePath,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.shopping_bag_outlined, size: 40,color: Colors.teal),
          ),
          Text(
            product.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          Text(
            "${product.price}",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          Consumer<Cartprovider>(
            builder: (context, value, child) {
              final inCart = value.model?.products.any((pro) => pro.id == product.id) ?? false;
              return ElevatedButton(
                onPressed: () async {
                  if (!inCart) {
                    await value.Addtocart(userId: userId, productid: product.id);
                  } else {
                    await value.RemoveFromcart(userId: userId, productid: product.id);
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: !inCart ? Colors.teal : Colors.red),
                child: Text(!inCart ? "Add to cart" : "Added"),
              );
            },
          ),
        ],
      ),
    );
  }
}
