import 'package:dio/dio.dart';
import 'package:e_comrcee_with_api_with_gad/Models/AuthModel.dart';

class Authservices {
  static Dio dio = Dio();
  static Future<Authmodel> Login({
    required String email,
    required String password,
  }) async {
    try {
      Response res = await dio.post(
        "https://ecommerceflutter2.runasp.net/api/Customer/login",
        data: {"email": email, "password": password},
      );
      return Authmodel.fromJson(res.data);
    } on DioException catch (error) {
      throw Exception(error.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<Authmodel> SignUp({
    required String name,
    required String contact,
    required String email,
    required String password,
  }) async {
    try {
      Response res = await dio.post(
        "https://ecommerceflutter2.runasp.net/api/Customer/signup",
        data: {
          "name": name,
          "contact": contact,
          "email": email,
          "password": password,
        },
      );
      return Authmodel.fromJson(res.data);
    } on DioException catch (error) {
      throw Exception(error.message);
    } catch (e) {
      throw Exception(e);
    }
  }
}
