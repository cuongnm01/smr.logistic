import 'package:get/get.dart';

import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_change_screen.dart';
import '../modules/forgot_password/views/forgot_password_otp_screen.dart';
import '../modules/forgot_password/views/forgot_password_screen.dart';
import '../modules/language/binding/language_binding.dart';
import '../modules/language/view/language_screen.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_screen.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_screen.dart';
import '../modules/main_guest/bindings/main_guest_binding.dart';
import '../modules/main_guest/views/main_guest_screen.dart';
import '../modules/news_list/bindings/news_list_binding.dart';
import '../modules/news_list/views/news_list_screen.dart';
import '../modules/on_boarding/binding/on_boarding_binding.dart';
import '../modules/on_boarding/view/on_boarding_screen.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_otp_screen.dart';
import '../modules/register/views/register_screen.dart';
import '../modules/register/views/register_success_screen.dart';
import '../modules/splash/binding/splash_binding.dart';
import '../modules/splash/view/splash_screen.dart';

part 'app_routes.dart';

const INITIAL = Routes.SPLASH;

final routePages = [
  GetPage(
    name: Routes.SPLASH,
    page: () => SplashScreen(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: Routes.LANGUAGE,
    page: () => LanguageScreen(),
    binding: LanguageBinding(),
  ),
  GetPage(
    name: Routes.ONBOARDING,
    page: () => OnBoardingScreen(),
    binding: OnBoardingBinding(),
  ),

  //login
  GetPage(
    name: Routes.LOGIN,
    page: () => LoginScreen(),
    binding: LoginBinding(),
  ),

  //register
  GetPage(
    name: Routes.REGISTER,
    page: () => RegisterScreen(),
    binding: RegisterBinding(),
  ),
  GetPage(
    name: Routes.REGISTER_OTP,
    page: () => RegisterOtpScreen(),
    binding: RegisterBinding(),
  ),
  GetPage(
    name: Routes.REGISTER_SUCCESS,
    page: () => RegisterSuccessScreen(),
    binding: RegisterBinding(),
  ),

  //forgot pass
  GetPage(
    name: Routes.FORGOT_PASSWORD,
    page: () => ForgotPasswordScreen(),
    binding: ForgotPasswordBinding(),
  ),
  GetPage(
    name: Routes.FORGOT_PASSWORD_OTP,
    page: () => ForgotPasswordOTPScreen(),
    binding: ForgotPasswordBinding(),
  ),
  GetPage(
    name: Routes.FORGOT_PASSWORD_CHANGE,
    page: () => ForgotPasswordChangeScreen(),
    binding: ForgotPasswordBinding(),
  ),
  GetPage(
    name: Routes.MAIN,
    page: () => MainScreen(),
    binding: MainBinding(),
  ),
  GetPage(
    name: Routes.MAIN_GUEST,
    page: () => MainGuestScreen(),
    binding: MainGuestBinding(),
  ),

  GetPage(
      name: Routes.NEWS_LIST,
      page: () => NewsListScreen(),
      binding: NewsListBinding()),

 
];
