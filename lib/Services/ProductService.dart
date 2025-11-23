import 'package:dio/dio.dart';
import 'package:e_comrcee_with_api_with_gad/Models/ProductModel.dart';

class Productservice {
  static Dio dio = Dio();
  static Future<Productmodel> GetAllProduct()
  async{
    try{
      Response res = await dio.get("https://ecommerceflutter2.runasp.net/api/Product/all");
      return Productmodel.fromJson(json: res.data);
    }on DioException catch(error)
    {
      throw Exception(error.message);
    }catch(e)
    {
      throw Exception(e);
    }
  }
}