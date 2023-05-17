import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ui_api/request/login/login_request.dart';
import 'package:ui_api/request/register/register_request.dart';
import 'package:ui_api/response/base_response.dart';
import 'package:ui_api/response/general/master_data_response.dart';
import 'package:ui_api/response/home/home_response.dart';
import 'package:ui_api/response/user/login_response.dart';
import 'package:ui_api/response/user/user_response.dart';

import '../../request/order/fee_request.dart';
import '../../request/order/order_request.dart';
import '../../request/user/changepass_request.dart';
import '../../request/user/update_info_request.dart';
import '../../response/category/categories_response.dart';
import '../../response/master/service_type_response.dart';
import '../../response/master/shipping_type_response.dart';
import '../../response/order/order_response.dart';
import '../../response/order/orders_response.dart';
import '../../response/product/fee_response.dart';
import '../../response/product/products_response.dart';

part 'app_ui_api.g.dart';

@RestApi()
abstract class AppUIAPI {
  factory AppUIAPI(Dio dio) = _AppUIAPI;
  //master data
  @GET('/v1/masterData')
  Future<MasterDataResponse> masterData();

  //get shipping type
  @GET('/v1/config/shipping-type')
  Future<ShippingTypeResponse> getShippingType();

  //get service type
  @GET('/v1/config/service-type')
  Future<ServiceTypeResponse> getServiceType();

  //User
  @POST('/app/v1/auth/login')
  Future<LoginResponse> login(@Body() LoginRequest request);

  //Register
  @POST('/app/v1/auth/register')
  Future<LoginResponse> register(@Body() RegisterRequest request);

  // get info
  @GET('/v1/customer/me')
  Future<UserResponse> getInfo();

  // home
  @GET('/v1/customer/home')
  Future<HomeResponse> home();

  //delete user
  @POST('/v1/user/deleteUser')
  Future<BaseResponse> deleteUser();

  // get category
  @GET('/app/v1/categories')
  Future<CategoriesResponse> getCategories();

  // get products
  @GET('/app/v1/categories/{id}/products')
  Future<ProductsResponse> getProducts(
    @Path('id') String id,
  );

  // check giá
  @POST('/app/v1/orders/fees')
  Future<FeeResponse> getFee(@Body() FeeRequest request);

  //create order
  @POST('/app/v1/orders')
  Future<BaseResponse> createOrder(@Body() OrderRequest request);

  // get list order
  @GET('/app/v1/orders')
  Future<OrdersResponse> getOrders(
    @Query('ServiceType') int? serviceType,
    @Query('ShippingType') int? shippingType,
    @Query('Keyword') String? keyword,
    @Query('Page') int? page,
    @Query('PageSize') int? pageSize,
  );

  // get order detail
  @GET('/app/v1/orders/{id}')
  Future<OrderResponse> getOrderDetail(
    @Path('id') String id,
  );

  //Update user
  @PUT('/app/v1/accounts')
  Future<UserResponse> updateInfo(@Body() UpdateInfoRequest request);

   //Update user
  @PUT('/app/v1/accounts/change-password')
  Future<BaseResponse> changePass(@Body() ChangePassRequest request);
}
