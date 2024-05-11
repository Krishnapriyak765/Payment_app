import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:payment_app/app/modules/home/controllers/home_controller.dart';
import 'package:payment_app/utils/asset_constants.dart';
import 'package:payment_app/utils/color_constants.dart';
import 'package:payment_app/utils/string_constants.dart';

class RewardAlertDialog extends GetView<HomeController> {
  const RewardAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                AssetConst.luluLogo,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.close),
                ),
              ),
            ],
          ),
          Center(
            child: Image.asset(
              AssetConst.coinEarth,
            ),
          ),
          Text(
            StringConst.enterVendorCode,
            style: TextStyle(fontSize: 12, color: AppColors.grey),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 10,
          ),
          OTPTextField(
              controller: controller.otpController,
              length: 4,
              keyboardType: TextInputType.number,
              width: MediaQuery.of(context).size.width,
              textFieldAlignment: MainAxisAlignment.start,
              spaceBetween: 5,
              fieldWidth: 40,
              fieldStyle: FieldStyle.box,
              outlineBorderRadius: 5,
              style: TextStyle(fontSize: 10),
              onChanged: (pin) {
                print("Changed: " + pin);
                controller.vendorCodeChanged(code: pin);
              },
              onCompleted: (pin) {
                controller.vendorCodeChanged(code: pin);
              }),
          const SizedBox(
            height: 15,
          ),
          const Text(
            StringConst.grabYourTickets,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            StringConst.effortlesslyExpand,
            style: TextStyle(fontSize: 12, color: AppColors.grey),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringConst.expiry,
                    style: TextStyle(fontSize: 12, color: AppColors.grey),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    StringConst.worthOfVoucher,
                    style: TextStyle(fontSize: 12, color: AppColors.grey),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '22 March 2024',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                    RichText(
                        text: TextSpan(
                            text: '345',
                            style: TextStyle(
                                color: AppColors.blue,
                                fontWeight: FontWeight.w800,
                                fontSize: 20),
                            children: <TextSpan>[
                          TextSpan(
                            text: ' AED',
                            style: TextStyle(
                                color: AppColors.grey,
                                fontWeight: FontWeight.w200,
                                fontSize: 14),
                          )
                        ])),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                StringConst.totalCoinsCost,
                style: TextStyle(fontSize: 12, color: AppColors.grey),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                    text: '400 ',
                    style: TextStyle(
                        color: AppColors.blue,
                        fontWeight: FontWeight.w800,
                        fontSize: 20),
                    children: <TextSpan>[
                      TextSpan(
                        text: StringConst.coins,
                        style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w200,
                            fontSize: 14),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() => controller.vendorCode.value.length != 4
                  ? Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          StringConst.redeemNow,
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.secondaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    )
                  : Container(
                      width: 180,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.check,
                              color: AppColors.secondaryColor,
                            ),
                            Text(
                              StringConst.redeemSuccessful,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.secondaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    )),
            ],
          ),
        ],
      ),
    );
  }
}
