import 'package:e_comrcee_with_api_with_gad/Providers/CartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key, required this.userId});
  final int userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Consumer<Cartprovider>(
        builder: (context, value, child) {
          value.getallCart(userId: userId);
          final model = value.model;
          final products = model?.products;
          if (products == null) {
            return Center(
              child: Text(
                "No Products in cart",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            );
          } else {
            return ListView.separated(
              itemBuilder: (context, index) {
                final product = products[index];
                return Container(
                  color: Colors.grey,
                  child: ListTile(
                    title: Text(
                      product.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    subtitle: Text("${product.price}"),
                    leading: Image.network(
                      product.imagePath,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.shopping_bag_outlined, color: Colors.teal),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        value.RemoveFromcart(
                          userId: userId,
                          productid: product.id,
                        );
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 5),
              itemCount: products.length,
            );
          }
        },
      ),
      bottomNavigationBar: Consumer<Cartprovider>(
        builder: (context, value, child) {
          final total = value.model?.totalPrice ?? 0;
          return Container(
            color: Colors.teal,
            height: 80,
            child: Center(
              child: Text(
                "${total - 18000}\$",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
