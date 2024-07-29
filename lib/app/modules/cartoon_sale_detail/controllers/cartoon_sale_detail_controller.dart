import 'package:cartoon_sale/app/tools/cartoon_model.dart';
import 'package:cartoon_sale/app/tools/cs_database_db.dart';
import 'package:get/get.dart';

class CartoonSaleDetailController extends GetxController {
  final CartoonModel model = Get.arguments["model"];
  final sales = <CSSaleModel>[].obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getAllsaleDatas();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getAllsaleDatas() async {
    sales.value = await CSDatabase().getAllSaleDetail(cid: model.id);
  }
}
