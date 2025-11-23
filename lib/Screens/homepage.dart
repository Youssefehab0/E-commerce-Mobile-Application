import 'package:e_comrcee_with_api_with_gad/Providers/CartProvider.dart';
import 'package:e_comrcee_with_api_with_gad/Providers/ProductProvider.dart';
import 'package:e_comrcee_with_api_with_gad/Screens/cart_page.dart';
import 'package:e_comrcee_with_api_with_gad/Widgets/CustomProductitem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key, required this.userId});
  final int userId;
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Cartprovider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Consumer<Productprovider>(
        builder: (context, value, child) {
          final products = value.model?.Products;
          if (products == null) {
            value.GetAllProduct();
            cartProvider.getallCart(userId: userId);
            return Center(child: RefreshProgressIndicator());
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 7,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Customproductitem(
                  product: products[index],
                  userId: userId,
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage(userId: userId)),
          );
        },
        backgroundColor: Colors.teal,
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
