import 'package:bot_toast/bot_toast.dart';
import 'package:cartoon_sale/app/modules/cartoon_list/controllers/cartoon_list_controller.dart';
import 'package:cartoon_sale/app/modules/cartoon_sale_detail/controllers/cartoon_sale_detail_controller.dart';
import 'package:cartoon_sale/app/tools/cs_aleart.dart';
import 'package:cartoon_sale/app/tools/cs_database_db.dart';
import 'package:cartoon_sale/app/tools/pm_share_per.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class SettingsPageController extends GetxController {
  final totalP = 0.obs;
  final totalC = 0.obs;
  final todayP = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    totalP.value = CSSharedPreferences.getInt("total_price", defValue: 0)!;
    totalC.value = CSSharedPreferences.getInt("total_count", defValue: 0)!;
  }

  @override
  void onClose() {
    super.onClose();
  }

  void cellClick(int index) {
 
    if (index == 0) {
      showclearSalesAleart();
    } else if (index == 1) {
      showclearCartoonsAleart();
    } else if (index == 2) {
      Share.share('check out my website', subject: 'Look what I made!');
    } else if (index == 3) {
      showVersionAleart();
    } else if (index == 4) {
      showVersionAleart();
    }
  }

  void showclearSalesAleart() {
    Get.dialog(Center(
      child: CSAleart(
        title: "Do you want Clear all Sales?",
        contentStr: "",
        okAction: () {
          cleanDatas(true);
        },
      ),
    ));
  }

  void showclearCartoonsAleart() {
    Get.dialog(Center(
      child: CSAleart(
        title: "Do you want Clear all Cartoons?",
        contentStr: "",
        okAction: () {
          cleanDatas(false);
        },
      ),
    ));
  }

  void showVersionAleart() {
    Get.dialog(Center(
      child: CSAleart(
        title: "App Version",
        contentStr: "V1.0.0",
        okAction: Get.back,
      ),
    ));
  }

  void cleanDatas(bool isOnlySales) async {
    await CSDatabase().clean(onlySele: isOnlySales);

    BotToast.showText(text: "Clear Success");
    Get.back();

    if (isOnlySales) {
      if (Get.isRegistered<CartoonSaleDetailController>()) {
        Get.find<CartoonSaleDetailController>().getAllsaleDatas();
      }
    } else {
      if (Get.isRegistered<CartoonListController>()) {
        Get.find<CartoonListController>().loadAllCartoons();
      }
      if (Get.isRegistered<CartoonSaleDetailController>()) {
        Get.find<CartoonSaleDetailController>().getAllsaleDatas();
      }
      cleanSale();
    }
  }

  void cleanSale() async {
    totalP.value = 0;
    totalC.value = 0;
    todayP.value = 0;
    CSSharedPreferences.putInt("total_count", 0);
    CSSharedPreferences.putInt("total_price", 0);
  }
}
