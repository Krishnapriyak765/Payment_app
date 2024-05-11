import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:payment_app/utils/asset_constants.dart';
import 'package:payment_app/utils/color_constants.dart';
import 'package:payment_app/utils/constants.dart';
import 'package:payment_app/utils/string_constants.dart';

import '../../redeemCoupons/controllers/redeem_coupons_controller.dart';
import '../../redeemCoupons/views/redeem_coupons_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //!---------(body section)

        body: _bodyContent(context),
      ),
    );
  }

  Column _bodyContent(BuildContext context) {
    return Column(
      children: [
        //!---------(reward section)

        _rewardSection(),

        //!---------(redeem section)
        _redeemSection(context),
      ],
    );
  }

  Container _rewardSection() {
    return Container(
      width: Constants.width,
      color: AppColors.blueAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //!---------(space)

          SizedBox(
            height: Constants.height * .015,
          ),
          //!---------(appBar section)
          _appBarSection(),
          //!---------(space)

          SizedBox(
            height: Constants.height * .015,
          ),
          //!---------(rewards section)

          Text(
            StringConst.rewards,
            style: TextStyle(
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.w300,
                fontSize: 18),
          ),
          SizedBox(
            height: Constants.height * .005,
          ),
          //!---------(coins)

          RichText(
              text: TextSpan(
                  text: StringConst.amountInText,
                  style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 50),
                  children: <TextSpan>[
                TextSpan(
                  text: StringConst.coins,
                  style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w200,
                      fontSize: 18),
                )
              ])),
          //!---------(space)
          SizedBox(
            height: Constants.height * .005,
          ),
          //!---------(redeem button)
          _redeemButton(),
          //!---------(space)
          SizedBox(
            height: Constants.height * .1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //!---------(wallet)
              _wallet(),
              //!---------(space)
              SizedBox(
                width: Constants.width * .05,
              ),
              //!---------(card /upi)
              _cardUpi(),
            ],
          ),
          //!---------(space)
          SizedBox(
            height: Constants.height * .02,
          ),
        ],
      ),
    );
  }

  Expanded _redeemSection(BuildContext context) {
    return Expanded(
      child: Container(
        width: Constants.width,
        color: AppColors.secondaryColor,
        child: Column(
          children: [
            //!---------(redeemed title section)

            _redeemTitleSection(),
            //!---------(couponList)

            _couponList(context),
          ],
        ),
      ),
    );
  }

  Padding _redeemTitleSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            StringConst.redeemedCoupons,
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          InkWell(
              onTap: () {
                Get.put(RedeemCouponsController());
                Get.to( RedeemCouponsView());
              },
              child: Text(
                StringConst.viewAll,
                style: TextStyle(
                  color: AppColors.blue,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }

  Expanded _couponList(BuildContext context1) {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return _singleWidget(context1);
          }),
    );
  }

  GestureDetector _singleWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.openReward();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: Constants.width * .44,
          decoration: BoxDecoration(
              color: AppColors.blue50, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Center(
                  child: Image.asset(
                    AssetConst.coinEarth,
                  ),
                )),
                const Text(
                  StringConst.grabYourTickets,
                  textAlign: TextAlign.left,
                ),
                Container(
                  height: 50,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: const DecorationImage(
                          image: AssetImage(AssetConst.luluLogo))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBarSection() {
    return AppBar(
      backgroundColor: AppColors.blueAccent,
      leading: Image.asset(AssetConst.drawer),
      actions: [
        Image.asset(AssetConst.search),
        const SizedBox(
          width: 5,
        ),
        CircleAvatar(
          radius: 15,
          child: Image.asset(AssetConst.profile),
        ),
        const SizedBox(
          width: 5,
        ),
      ],
    );
  }

  GestureDetector _redeemButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: Constants.height * .05,
        width: Constants.width * .45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white12,
        ),
        child: Center(
          child: Text(
            StringConst.redeemReward,
            style: TextStyle(
              color: AppColors.secondaryColor,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Column _wallet() {
    return Column(
      children: [
        Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
              color: AppColors.white12,
              borderRadius: BorderRadius.circular(18)),
          child: Image.asset(AssetConst.wallet),
        ),
        Text(
          StringConst.wallets,
          style: TextStyle(
              color: AppColors.secondaryColor,
              fontWeight: FontWeight.w300,
              fontSize: 12),
        ),
      ],
    );
  }

  Column _cardUpi() {
    return Column(
      children: [
        Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
              color: AppColors.white12,
              borderRadius: BorderRadius.circular(18)),
          child: Image.asset(AssetConst.creditCard),
        ),
        Text(
          StringConst.cardsUPIs,
          style: TextStyle(
              color: AppColors.secondaryColor,
              fontWeight: FontWeight.w300,
              fontSize: 12),
        )
      ],
    );
  }
}
