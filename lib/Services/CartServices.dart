import 'package:dio/dio.dart';
import 'package:e_comrcee_with_api_with_gad/Models/CartModel.dart';

class Cartservices {
  static Dio dio = Dio();
  static Future<Cartmodel> get({required int userId}) async {
    try {
      Response res = await dio.get(
        "https://ecommerceflutter2.runasp.net/api/Cart/$userId",
      );
      return Cartmodel.fromJson(res.data);
    } on DioException catch (error) {
      throw Exception(error.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<String> Addtocart({required int userId, required int productid}) async {
    try {
      Response res = await dio.post(
        "https://ecommerceflutter2.runasp.net/api/Cart/$userId/add-product",
        data: {"productId": productid},
      );
      return res.data["message"];
    } on DioException catch (error) {
      throw Exception(error.message);
    } catch (e) {
      throw Exception(e);
    }
  }
  static Future<String> RemoveFromcart({required int userId, required int productid}) async {
    try {
      Response res = await dio.delete(
        "https://ecommerceflutter2.runasp.net/api/Cart/$userId/remove-product",
        data: {"productId": productid},
      );
      return res.data["message"];
    } on DioException catch (error) 
    {
      throw Exception(error.message);
    } catch (e) {
      throw Exception(e);
    }
  }
}
