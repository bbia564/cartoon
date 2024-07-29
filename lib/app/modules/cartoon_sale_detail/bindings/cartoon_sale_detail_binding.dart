import 'package:get/get.dart';

import '../controllers/cartoon_sale_detail_controller.dart';

class CartoonSaleDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartoonSaleDetailController>(
      () => CartoonSaleDetailController(),
    );
  }
}
