import 'package:get/get.dart';

import '../controllers/redeem_coupons_controller.dart';

class RedeemCouponsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RedeemCouponsController>(
      () => RedeemCouponsController(),
    );
  }
}
