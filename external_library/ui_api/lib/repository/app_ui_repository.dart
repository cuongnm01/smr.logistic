import 'package:ui_api/request/login/login_request.dart';
import 'package:ui_api/request/register/register_request.dart';
import 'package:ui_api/response/base_response.dart';
import 'package:ui_api/response/general/master_data_response.dart';
import 'package:ui_api/response/user/login_response.dart';
import 'package:ui_api/response/user/user_response.dart';

import '../request/order/fee_request.dart';
import '../request/order/order_request.dart';
import '../request/user/changepass_request.dart';
import '../request/user/update_info_request.dart';
import '../response/category/categories_response.dart';
import '../response/master/service_type_response.dart';
import '../response/master/shipping_type_response.dart';
import '../response/order/order_response.dart';
import '../response/order/orders_response.dart';
import '../response/product/fee_response.dart';
import '../response/product/products_response.dart';

abstract class AppUIRepository {
  //masterdata
  Future<MasterDataResponse> masterData();

  //get shipping type
  Future<ShippingTypeResponse> getShippingType();

  //get service type
  Future<ServiceTypeResponse> getServiceType();

  /* User */
  Future<LoginResponse> login(LoginRequest loginRequest);

  //Register
  Future<LoginResponse> register(RegisterRequest request);

  //get info
  Future<UserResponse> getInfo();

  Future<BaseResponse> deleteUser();

  // get category
  Future<CategoriesResponse> getCategories();

  // get products
  Future<ProductsResponse> getProducts(
    String id,
  );

  //get fee
  Future<FeeResponse> getFee(FeeRequest request);

  //create order
  Future<BaseResponse> createOrder(OrderRequest request);

  // get list order
  Future<OrdersResponse> getOrders({
    int? serviceType,
    int? shippingType,
    String? keyword,
    int? page,
    int? pageSize,
  });

  // get order detail
  Future<OrderResponse> getOrderDetail(String id);

  // update info
  Future<UserResponse> updateInfo(UpdateInfoRequest request);

  // change pass
  Future<BaseResponse> changePass(ChangePassRequest request);
}
