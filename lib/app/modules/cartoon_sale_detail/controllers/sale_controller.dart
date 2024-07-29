import 'package:bot_toast/bot_toast.dart';
import 'package:cartoon_sale/app/modules/cartoon_list/controllers/cartoon_list_controller.dart';
import 'package:cartoon_sale/app/modules/cartoon_sale_detail/controllers/cartoon_sale_detail_controller.dart';
import 'package:cartoon_sale/app/tools/app_util.dart';
import 'package:cartoon_sale/app/tools/cartoon_model.dart';
import 'package:cartoon_sale/app/tools/cs_database_db.dart';
import 'package:get/get.dart';

class SaleController extends GetxController {
 
  final count = 0.obs;
  final price = 0.obs;

  late int cid;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void submit() async {
    if (count.value <= 0) {
      BotToast.showText(text: "Please select count");

      return;
    }

    final sale = CSSaleModel();
    sale.cID = cid;
    sale.amount = count.value;
    sale.saleDate = PMAppUtil.formatDateWithoutHour(dateTime: DateTime.now());

    await CSDatabase().insertSaleRecord(sale);

    if (Get.isRegistered<CartoonSaleDetailController>()) {
      Get.find<CartoonSaleDetailController>().getAllsaleDatas();
    }
    Get.back();
    BotToast.showText(text: "Sale Success");
  }
}
