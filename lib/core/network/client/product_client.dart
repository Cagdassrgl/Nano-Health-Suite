import 'package:dio/dio.dart';
import 'package:nano_health_suite/core/network/model/product/product_model.dart';
import 'package:nano_health_suite/core/network/url/product_url.dart';
import 'package:retrofit/retrofit.dart';

part 'product_client.g.dart';

@RestApi()
abstract class ProductClient {

  factory ProductClient(Dio dio, {String baseUrl}) = _ProductClient;
  
  @GET(ProductUrl.GET_PRODUCTS)
  Future<HttpResponse<List<ProductModel?>?>> getProducts();
}
