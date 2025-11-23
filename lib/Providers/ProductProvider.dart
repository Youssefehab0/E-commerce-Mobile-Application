import 'package:e_comrcee_with_api_with_gad/Models/ProductModel.dart';
import 'package:e_comrcee_with_api_with_gad/Services/ProductService.dart';
import 'package:flutter/material.dart';

class Productprovider extends ChangeNotifier{
  Productmodel? model;
  Future<void> GetAllProduct()async
  {
    model = await Productservice.GetAllProduct();
    notifyListeners();
  }
}