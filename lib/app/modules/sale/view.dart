import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class SaleVi extends GetView<PageLogic> {
  const SaleVi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.towne.value
              ? const CircularProgressIndicator(color: Colors.black,)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.vpqy();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
