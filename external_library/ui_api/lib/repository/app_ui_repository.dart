import 'dart:io';

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


abstract class AppUIRepository {
  /* User */
  Future<LoginResponse> login(LoginRequest loginRequest);

  /* Line */
  Future<LoginResponse> loginLine(LoginRequest loginRequest);

  /* GG */
  Future<LoginResponse> loginGG(LoginRequest loginRequest);

  /* FB */
  Future<LoginResponse> loginFB(LoginRequest loginRequest);

  //logout
  Future<BaseResponse> logout();

  //Register
  Future<BaseResponse> register(RegisterRequest request);

  //Register Otp
  Future<LoginResponse> registerOtp(RegisterOtpRequest request);

  //resend Otp
  Future<BaseResponse> resendOtp(String email);

  //updateLangCode
  Future<BaseResponse> updateLangCode(String code);

  //changePass
  Future<BaseResponse> changePassword(ChangePassRequest request);

   //forgot pass
  Future<BaseResponse> forgetPassword(String email);
  //check otp
  Future<BaseResponse> forgetPasswordOtp(String code, String email);
  //reset Password
  Future<BaseResponse> resetPassword(
      String code, String email, String password);

  //update avatar
  Future<UserResponse> updateAvatar(File image);

  //update info
  Future<BaseResponse> updateInfo(UpdateInfoRequest request);

  //get info
  Future<UserResponse> getInfo();

  //masterdata
  Future<MasterDataResponse> masterData();

  //news list
  Future<NewsListResponse> newsList(int limit, int offset);

  //news detail
  Future<NewsDetailResponse> newsDetail(int id);

  //notification list
  Future<NotificationListResponse> notificationList(int limit, int offset);

  //notification detail
  Future<NotificationDetailResponse> notificationDetail(int id);

  //home
  Future<HomeResponse> home();

  //get district list
  Future<DistrictResponse> getDistrict(int id);

  Future<BaseResponse> deleteUser();
}
