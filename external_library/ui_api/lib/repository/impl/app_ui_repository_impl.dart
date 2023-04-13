import 'dart:io';

import 'package:ui_api/datasource/remote/app_ui_api.dart';
import 'package:ui_api/request/login/login_request.dart';
import 'package:ui_api/request/register/register_otp_request.dart';
import 'package:ui_api/request/register/register_request.dart';
import 'package:ui_api/request/user/changepass_request.dart';
import 'package:ui_api/request/user/update_info_request.dart';
import 'package:ui_api/response/base_response.dart';
import 'package:ui_api/response/general/district_response.dart';
import 'package:ui_api/response/general/master_data_response.dart';
import 'package:ui_api/response/home/home_response.dart';
import 'package:ui_api/response/news/news_detail_response.dart';
import 'package:ui_api/response/news/news_list_response.dart';
import 'package:ui_api/response/notifications/notification_detail_response.dart';
import 'package:ui_api/response/notifications/notification_list_response.dart';
import 'package:ui_api/response/user/login_response.dart';
import 'package:ui_api/response/user/user_response.dart';

import '../app_ui_repository.dart';

class AppUIRepositoryImpl extends AppUIRepository {
  final AppUIAPI _api;

  AppUIRepositoryImpl(this._api);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) {
    return _api.login(loginRequest);
  }

  @override
  Future<LoginResponse> loginLine(LoginRequest loginRequest) {
    return _api.loginLine(loginRequest);
  }

  @override
  Future<LoginResponse> loginGG(LoginRequest loginRequest) {
    return _api.loginGG(loginRequest);
  }

  @override
  Future<LoginResponse> loginFB(LoginRequest loginRequest) {
    return _api.loginFB(loginRequest);
  }

  @override
  Future<BaseResponse> logout() {
    return _api.logout();
  }

  @override
  Future<BaseResponse> register(RegisterRequest request) {
    return _api.register(request);
  }

  @override
  Future<LoginResponse> registerOtp(RegisterOtpRequest request) {
    return _api.registerOtp(request);
  }

  @override
  Future<BaseResponse> resendOtp(String email) {
    return _api.resendOtp(email);
  }

  @override
  Future<BaseResponse> forgetPassword(String email) {
    return _api.forgetPassword(email);
  }

  @override
  Future<BaseResponse> forgetPasswordOtp(String code, String email) {
    return _api.forgetPasswordOtp(code, email);
  }

  @override
  Future<BaseResponse> resetPassword(
      String code, String email, String password) {
    return _api.resetPassword(code, email, password);
  }

  @override
  Future<BaseResponse> updateLangCode(String code) {
    return _api.updateLangCode(code);
  }

  @override
  Future<BaseResponse> changePassword(ChangePassRequest request) {
    return _api.changePassword(request);
  }

  @override
  Future<UserResponse> updateAvatar(File image) {
    return _api.updateAvatar(image);
  }

  @override
  Future<UserResponse> getInfo() {
    return _api.getInfo();
  }

  @override
  Future<BaseResponse> updateInfo(UpdateInfoRequest request) {
    return _api.updateInfo(request);
  }

  @override
  Future<MasterDataResponse> masterData() {
    return _api.masterData();
  }

  @override
  Future<NewsListResponse> newsList(int limit, int offset) {
    return _api.newsList(limit, offset);
  }

  @override
  Future<NewsDetailResponse> newsDetail(int id) {
    return _api.newsDetail(id);
  }

  @override
  Future<NotificationListResponse> notificationList(int limit, int offset) {
    return _api.notificationList(limit, offset);
  }

  @override
  Future<NotificationDetailResponse> notificationDetail(int id) {
    return _api.notificationDetail(id);
  }

  @override
  Future<HomeResponse> home() {
    return _api.home();
  }

  @override
  Future<DistrictResponse> getDistrict(int id) {
    return _api.getDistrict(id);
  }

  @override
  Future<BaseResponse> deleteUser() {
    return _api.deleteUser();
  }
}
