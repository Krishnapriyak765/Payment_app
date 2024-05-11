import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/coupons_collected_controller.dart';

class CouponsCollectedView extends GetView<CouponsCollectedController> {
  const CouponsCollectedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CouponsCollectedView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CouponsCollectedView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
