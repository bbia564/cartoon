import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:cartoon_sale/app/modules/cartoon_list/controllers/cartoon_list_controller.dart';
import 'package:cartoon_sale/app/tools/app_util.dart';
import 'package:cartoon_sale/app/tools/cartoon_model.dart';
import 'package:cartoon_sale/app/tools/componets.dart';
import 'package:cartoon_sale/app/tools/cs_database_db.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCartoonController extends GetxController {
  final nameInputcontol = TextEditingController();
  final date = Rx<DateTime?>(null);
  final imageData = "".obs;

  final prince = 0.obs;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameInputcontol.dispose();
    super.onClose();
  }

  void selectPic() async {
    final file = await csPickSingleImageXFile();
    if (file == null) {
      return;
    }

    final bytes = await file.readAsBytes();
    imageData.value = base64Encode(bytes);
  }

  void selectDate() async {
    csShowDatePicker("Select Date", (datetime) {
      date.value = datetime;
    });
  }

  void submit() async {
    if (imageData.value.isEmpty) {
      BotToast.showText(text: "Please select a photo");
      return;
    }
    if (nameInputcontol.text.isEmpty) {
      BotToast.showText(text: "Please input cartoon name");
      return;
    }

    if (date.value == null) {
      BotToast.showText(text: "Please select cartoon public date");
      return;
    }

    if (prince.value <= 0) {
      BotToast.showText(text: "Please input price");
      return;
    }

    if (count.value <= 0) {
      BotToast.showText(text: "Please input count");
      return;
    }

    final model = CartoonModel();
    model.localPhoto = "";
    model.name = nameInputcontol.text;
    model.photo = imageData.value;
    model.amount = count.value;
    model.price = prince.value;
    model.pubTime = PMAppUtil.formatDateWithoutHour(dateTime: date.value!);

    await CSDatabase().insertCartoonData(model);
    if (Get.isRegistered<CartoonListController>()) {
      Get.find<CartoonListController>().loadAllCartoons();
    }

    Get.back();
    BotToast.showText(text: "Store cartoon Success");
  }
}
