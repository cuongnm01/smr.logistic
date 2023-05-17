import 'package:get/get.dart';

import '../modules/auth/change_pass/bindings/change_pass_binding.dart';
import '../modules/auth/change_pass/views/change_pass_screen.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_screen.dart';
import '../modules/auth/register/bindings/register_binding.dart';
import '../modules/auth/register/views/register_screen.dart';
import '../modules/main/main/bindings/main_binding.dart';
import '../modules/main/main/views/main_screen.dart';
import '../modules/on_boarding/binding/on_boarding_binding.dart';
import '../modules/on_boarding/view/on_boarding_screen.dart';
import '../modules/orders/categories/bindings/categories_binding.dart';
import '../modules/orders/categories/views/categories_screen.dart';
import '../modules/orders/order_history/bindings/order_history_binding.dart';
import '../modules/orders/order_history/views/order_history_screen.dart';
import '../modules/orders/order_history_detail/bindings/order_history_detail_binding.dart';
import '../modules/orders/order_history_detail/views/order_history_detail_screen.dart';
import '../modules/orders/order_product/bindings/order_product_binding.dart';
import '../modules/orders/order_product/views/order_product_screen.dart';
import '../modules/orders/products/bindings/products_binding.dart';
import '../modules/orders/products/views/products_screen.dart';
import '../modules/profile/profile/bindings/profile_binding.dart';
import '../modules/profile/profile/views/profile_screen.dart';
import '../modules/profile/profile_update/bindings/profile_update_binding.dart';
import '../modules/profile/profile_update/views/profile_update_screen.dart';
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
    name: Routes.MAIN,
    page: () => MainScreen(),
    binding: MainBinding(),
  ),

  GetPage(
    name: Routes.PROFILE,
    page: () => ProfileScreen(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: Routes.PROFILE_UPDATE,
    page: () => ProfileUpdateScreen(),
    binding: ProfileUpdateBinding(),
  ),
  GetPage(
    name: Routes.ORDER_PRODUCT,
    page: () => OrderProductScreen(),
    binding: OrderProductBinding(),
  ),
  GetPage(
    name: Routes.CATEGORIES,
    page: () => CategoriesScreen(),
    binding: CategoriesBinding(),
  ),
  GetPage(
    name: Routes.PRODUCTS,
    page: () => ProductsScreen(),
    binding: ProductsBinding(),
  ),
  GetPage(
    name: Routes.ORDER_HISTORY,
    page: () => OrderHistoryScreen(),
    binding: OrderHistoryBinding(),
  ),
 GetPage(
    name: Routes.ORDER_HISTORY_DETAIL,
    page: () => OrderHistoryDetailScreen(),
    binding: OrderHistoryDetailBinding(),
  ),

  GetPage(
    name: Routes.CHANGE_PASS,
    page: () => ChangePassScreen(),
    binding: ChangePassBinding(),
  ),
];
