import 'package:cartoon_sale/app/tools/cartoon_model.dart';
import 'package:cartoon_sale/app/tools/cs_database_db.dart';
import 'package:get/get.dart';

class CartoonListController extends GetxController {
  final allCartoons = <CartoonModel>[].obs;

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
    super.onClose();
  }

  void loadAllCartoons() async {
    allCartoons.value = await CSDatabase().allCartoon();
  }
}
