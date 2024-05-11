import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:payment_app/models/coupon_model.dart';


class RedeemCouponsController extends GetxController {
  //TODO: Implement RedeemCouponsController

  var isLoading = false.obs;
  CouponModel? couponModel;

   final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  fetchData()async{
    try{
      isLoading (true);
      http.Response response = await http.get(
        Uri.tryParse('https://loyalty-card.onrender.com/api/loyalitycard')!);
        if(response.statusCode == 200){
          // data sucess 
          print("+++++++++++++++++++++++");
          var result = jsonDecode(response.body);
          couponModel = CouponModel.fromJson(result);
        }else{
          ///error
          print("----------------------------");
        }
        }catch(e){
           print("error while grtting data run is $e");
    }finally{
      isLoading(false);
    }
  }

 

  List categories = ['All', 'Food', 'Travel', 'Cloth', 'Luxury'];
  List<Map> Shops = [
    {
      'ShopImage': Image.asset("assets/icons/donald"),
      'shopName': "McDonald's",
      'description': "Ramdaan New Offers",
    },
    {
      'ShopImage': Image.asset("assets/icons/starbucks"),
      'shopName': "StarBucks",
      'description': "Cofee for couples",
    },
  ];

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
