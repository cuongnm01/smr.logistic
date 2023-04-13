import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
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


part 'app_ui_api.g.dart';

@RestApi()
abstract class AppUIAPI {
  factory AppUIAPI(Dio dio) = _AppUIAPI;
  //master data
  @GET('/v1/masterData')
  Future<MasterDataResponse> masterData();

  //User
  @POST('/v1/customer/auth/login')
  Future<LoginResponse> login(@Body() LoginRequest request);

  //Login Line
  @POST('/v1/customer/auth/loginWithLine')
  Future<LoginResponse> loginLine(@Body() LoginRequest request);

  //Login GG
  @POST('/v1/customer/auth/loginWithGoogle')
  Future<LoginResponse> loginGG(@Body() LoginRequest request);

  //Login FB
  @POST('/v1/customer/auth/loginWithFacebook')
  Future<LoginResponse> loginFB(@Body() LoginRequest request);

  //master data
  @GET('/v1/customer/auth/logout')
  Future<BaseResponse> logout();

  //Register
  @POST('/v1/customer/auth/register')
  Future<BaseResponse> register(@Body() RegisterRequest request);

  //Register Otp
  @POST('/v1/customer/auth/active')
  Future<LoginResponse> registerOtp(@Body() RegisterOtpRequest request);

  //resend Otp
  @POST('/v1/customer/auth/resendActive')
  Future<BaseResponse> resendOtp(
    @Query('email') String email,
  );

  //Forgotpass
  @POST('/v1/customer/password/forget')
  Future<BaseResponse> forgetPassword(
    @Query('email') String email,
  );

  //ResetPass
  @POST('/v1/customer/password/checkOTPForgotPassword')
  Future<BaseResponse> forgetPasswordOtp(
    @Query('code') String code,
    @Query('email') String email,
  );

  //ResetPass
  @POST('/v1/customer/password/reset')
  Future<BaseResponse> resetPassword(
    @Query('code') String code,
    @Query('email') String email,
    @Query('new_password') String password,
  );

  //updateLangCode
  @POST('/v1/updateLangCode')
  Future<BaseResponse> updateLangCode(
    @Query('lang_code') String code,
  );

  //updateLangCode
  @POST('/v1/customer/password/change')
  Future<BaseResponse> changePassword(@Body() ChangePassRequest request);

  //update avatar
  @POST('/v1/user/update/avatar')
  Future<UserResponse> updateAvatar(@Part() File avatar_image);

  //update info
  @POST('/v1/customer/user/update')
  Future<BaseResponse> updateInfo(@Body() UpdateInfoRequest request);

  // get info
  @GET('/v1/customer/me')
  Future<UserResponse> getInfo();

  // home
  @GET('/v1/customer/home')
  Future<HomeResponse> home();

  // news
  @GET('/v1/news/list')
  Future<NewsListResponse> newsList(
    @Query('limit') int limit,
    @Query('offset') int offset,
  );

  // news detail
  @GET('/v1/news/detail')
  Future<NewsDetailResponse> newsDetail(
    @Query('news_id') int id,
  );

// notification
  @GET('/v1/notification/list')
  Future<NotificationListResponse> notificationList(
    @Query('limit') int limit,
    @Query('offset') int offset,
  );

  // notification detail
  @GET('/v1/notification/detail')
  Future<NotificationDetailResponse> notificationDetail(
    @Query('notification_id') int id,
  );

  //get district
  @GET('/v1/listDistrictByProvince')
  Future<DistrictResponse> getDistrict(
    @Query('province_id') int id,
  );

  //delete user
  @POST('/v1/user/deleteUser')
  Future<BaseResponse> deleteUser();
}
