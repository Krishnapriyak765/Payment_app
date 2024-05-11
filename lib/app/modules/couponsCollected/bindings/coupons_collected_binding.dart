import 'package:get/get.dart';

import '../controllers/coupons_collected_controller.dart';

class CouponsCollectedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CouponsCollectedController>(
      () => CouponsCollectedController(),
    );
  }
}
