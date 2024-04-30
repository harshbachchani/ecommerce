import 'package:ecommerce/features/authentication/screens/login/login.dart';
import 'package:ecommerce/features/authentication/screens/onBoarding/onboarding.dart';
import 'package:ecommerce/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:ecommerce/features/authentication/screens/signup/signup.dart';
import 'package:ecommerce/features/authentication/screens/signup/verfify_email.dart';
import 'package:ecommerce/features/personalization/screens/address/address.dart';
import 'package:ecommerce/features/personalization/screens/profile/profile.dart';
import 'package:ecommerce/features/personalization/screens/settings/settings.dart';
import 'package:ecommerce/features/shop/screens/cart/cart.dart';
import 'package:ecommerce/features/shop/screens/checkout/checkout.dart';
import 'package:ecommerce/features/shop/screens/home/home.dart';
import 'package:ecommerce/features/shop/screens/order/order.dart';
import 'package:ecommerce/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:ecommerce/features/shop/screens/store/store.dart';
import 'package:ecommerce/features/shop/screens/wishlist/wishlist.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: HRoutes.home, page: () => const HomeScreen()),
    GetPage(name: HRoutes.store, page: () => const StoreScreen()),
    GetPage(name: HRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: HRoutes.settings, page: () => const SettingsScreen()),
    GetPage(
        name: HRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: HRoutes.order, page: () => const OrderScreen()),
    GetPage(name: HRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: HRoutes.cart, page: () => const CartScreen()),
    GetPage(name: HRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: HRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: HRoutes.signup, page: () => const SignUpPage()),
    GetPage(name: HRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: HRoutes.signIn, page: () => const LoginScreen()),
    GetPage(
        name: HRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(name: HRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}
