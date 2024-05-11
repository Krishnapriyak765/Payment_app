import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:payment_app/common_widgets/reward_alert.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  OtpFieldController otpController = OtpFieldController();

  RxList couponImg = ['A', 'B', 'C'].obs;
  RxList coupontxt = ['600', '500', '100'].obs;
  @override
  void onInit() {
    super.onInit();
  }

  void openReward() {
    Get.dialog(
      const RewardAlertDialog(),
      barrierDismissible: true,
    );
  }

  RxString vendorCode = ''.obs;

  void vendorCodeChanged({required String code}) {
    if (code.length != 4) {
      vendorCode.value = '';
    } else {
      vendorCode.value = code;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
