import 'package:get/get.dart';

import '../app/modules/couponsCollected/bindings/coupons_collected_binding.dart';
import '../app/modules/couponsCollected/views/coupons_collected_view.dart';
import '../app/modules/home/bindings/home_binding.dart';
import '../app/modules/home/views/home_view.dart';
import '../app/modules/redeemCoupons/bindings/redeem_coupons_binding.dart';
import '../app/modules/redeemCoupons/views/redeem_coupons_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const String INITIAL = Routes.HOME;

  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage<dynamic>(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.REDEEM_COUPONS,
      page: () =>  RedeemCouponsView(),
      binding: RedeemCouponsBinding(),
    ),
    GetPage(
      name: _Paths.COUPONS_COLLECTED,
      page: () => const CouponsCollectedView(),
      binding: CouponsCollectedBinding(),
    ),
  ];
}
