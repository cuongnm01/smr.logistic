import 'package:ui_api/datasource/remote/app_ui_api.dart';
import 'package:ui_api/request/login/login_request.dart';
import 'package:ui_api/request/register/register_request.dart';
import 'package:ui_api/response/base_response.dart';
import 'package:ui_api/response/general/master_data_response.dart';
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
import '../app_ui_repository.dart';

class AppUIRepositoryImpl extends AppUIRepository {
  final AppUIAPI _api;

  AppUIRepositoryImpl(this._api);

  @override
  Future<MasterDataResponse> masterData() {
    return _api.masterData();
  }

  @override
  Future<ShippingTypeResponse> getShippingType() {
    return _api.getShippingType();
  }

  @override
  Future<ServiceTypeResponse> getServiceType() {
    return _api.getServiceType();
  }

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) {
    return _api.login(loginRequest);
  }

  @override
  Future<LoginResponse> register(RegisterRequest request) {
    return _api.register(request);
  }

  @override
  Future<UserResponse> getInfo() {
    return _api.getInfo();
  }

  @override
  Future<BaseResponse> deleteUser() {
    return _api.deleteUser();
  }

  // get category
  @override
  Future<CategoriesResponse> getCategories() {
    return _api.getCategories();
  }

  // get products
  @override
  Future<ProductsResponse> getProducts(
    String id,
  ) {
    return _api.getProducts(id);
  }

  //get fee
  @override
  Future<FeeResponse> getFee(FeeRequest request) {
    return _api.getFee(request);
  }

  //create order
  @override
  Future<BaseResponse> createOrder(OrderRequest request) {
    return _api.createOrder(request);
  }

  // get list order
  @override
  Future<OrdersResponse> getOrders({
    int? serviceType,
    int? shippingType,
    String? keyword,
    int? page,
    int? pageSize,
  }) {
    return _api.getOrders(serviceType, shippingType, keyword, page, pageSize);
  }

  // get order detail
  @override
  Future<OrderResponse> getOrderDetail(String id) {
    return _api.getOrderDetail(id);
  }

  // update info
  @override
  Future<UserResponse> updateInfo(UpdateInfoRequest request) {
    return _api.updateInfo(request);
  }

  // change pass
  @override
  Future<BaseResponse> changePass(ChangePassRequest request) {
    return _api.changePass(request);
  }
}
