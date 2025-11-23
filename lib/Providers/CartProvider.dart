import 'package:e_comrcee_with_api_with_gad/Models/CartModel.dart';
import 'package:e_comrcee_with_api_with_gad/Services/CartServices.dart';
import 'package:flutter/foundation.dart';

class Cartprovider extends ChangeNotifier {
  Cartmodel? model;
  String? message;
  Future<void> getallCart({required int userId}) async {
    model = await Cartservices.get(userId: userId);
    notifyListeners();
  }
  
  Future<void> Addtocart({required int userId, required int productid}) async {
    message = await Cartservices.Addtocart(userId: userId, productid: productid);
    notifyListeners();
    await getallCart(userId: userId);
  }

  Future<void> RemoveFromcart({required int userId, required int productid}) async {
    message = await Cartservices.RemoveFromcart(userId: userId, productid: productid);
    notifyListeners();
    await getallCart(userId: userId);
  }
}
