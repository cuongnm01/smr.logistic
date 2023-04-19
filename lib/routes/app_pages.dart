import 'package:get/get.dart';

import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_screen.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_screen.dart';
import '../modules/on_boarding/binding/on_boarding_binding.dart';
import '../modules/on_boarding/view/on_boarding_screen.dart';
import '../modules/order_product/categories/bindings/categories_binding.dart';
import '../modules/order_product/categories/views/categories_screen.dart';
import '../modules/order_product/order_history/bindings/order_history_binding.dart';
import '../modules/order_product/order_history/views/order_history_screen.dart';
import '../modules/order_product/order_product/bindings/order_product_binding.dart';
import '../modules/order_product/order_product/views/order_product_screen.dart';
import '../modules/order_product/products/bindings/products_binding.dart';
import '../modules/order_product/products/views/products_screen.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_screen.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_screen.dart';
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
];
