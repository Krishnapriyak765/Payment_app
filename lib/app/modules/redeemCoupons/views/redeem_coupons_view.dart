import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:payment_app/app/modules/home/controllers/home_controller.dart';
import '../controllers/redeem_coupons_controller.dart';

class RedeemCouponsView extends GetView<RedeemCouponsController> {
   RedeemCouponsView({Key? key}) : super(key: key);

  RedeemCouponsController redeemController = Get.put(RedeemCouponsController());
  @override
  Widget build(BuildContext context) {
    print("88888888888888");
    print(redeemController.couponModel);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Redeem Coupons'),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('home');
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: Container(
          height: 800,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 30,
                      width: 370,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:4,
                          // controller.categories.length,
                          itemBuilder: (BuildContext context, int index) {
                            print(redeemController.couponModel!.category.length);
                            return Padding(
                              padding: const EdgeInsets.only(left: 4, right: 4),
                              child: Container(
                                height: 20,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    // child: Text(redeemController.couponModel!.category[index])
                                    ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shops Offering Coupons',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text('24 coupons', 
                    style: TextStyle(color: Colors.grey))
                  ],
                ),
                Divider(
                  color: Colors.grey[300],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 585,
                  child: Obx(
                  () => ListView.builder(
                    itemCount: redeemController.couponModel!.noOfCards,
                      itemBuilder: (BuildContext context, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  child: Image.asset(redeemController.couponModel!.brand[index]),
                                // Image.asset('assets/icons/donald.png'),
                                ),
                                //  IconButton(onPressed: (){}, icon: Icon(Icons.account_circle_rounded))
                    
                                Container(
                                  height: 40,
                                  child:  Column(
                                    children: [
                                      Text(redeemController.couponModel!.title[index])
                                      
                                      // Text("McDonald's"),
                                      // Text("Ramdaan New Offers")
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                                height: 250,
                                width: 380,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Obx(
                                    ()=> ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: redeemController.couponModel!.noOfCards,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return InkWell(
                                            onTap: () {
                                              Get.find<HomeController>()
                                                  .openReward();
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 160,
                                                decoration: BoxDecoration(
                                                    color: Colors.blue[50],
                                                    borderRadius:
                                                        BorderRadius.circular(18)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Center(
                                                        child: Container(
                                                          height: 80,
                                                          width: 80,
                                                          child: redeemController.couponModel!.image.isNotEmpty?
                                                          Image.asset(redeemController.couponModel!.image[index]):Image.asset(
                                                              'assets/icons/cookie.png'),
                                                        ),
                                                      ),
                                                      // const SizedBox(
                                                      //   height: 25,
                                                      // ),
                                                      // const Text(redeemController.couponModel!.description.isNotEmpty?
                                                      // redeemController.couponModel!.description:
                                                      //     'Grab your ticket for next purchase'),
                                                      // Container(
                                                      //   height: 50,
                                                      //   width: 70,
                                                      //   decoration: BoxDecoration(
                                                      //       color: Colors.blue[50],
                                                      //       borderRadius:
                                                      //           BorderRadius
                                                      //               .circular(18)),
                                                      //   child: Image.asset(
                                                      //       'assets/icons/luluLogo.png'),
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                )),
                          ],
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
