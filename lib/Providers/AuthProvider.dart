import 'package:e_comrcee_with_api_with_gad/Models/AuthModel.dart';
import 'package:e_comrcee_with_api_with_gad/Services/AuthServices.dart';
import 'package:flutter/material.dart';

class Authprovider extends ChangeNotifier {
  Authmodel ?model;
  Future<void> Login({
    required String email,
    required String password,
  })
  async{
    model = await Authservices.Login(email: email, password: password);
    notifyListeners();
  }
  Future<void> SignUp({
    required String name,
    required String contact,
    required String email,
    required String password,
  })
  async{
    model = await Authservices.SignUp(name: name, contact: contact, email: email, password: password);
    notifyListeners();
  }
}