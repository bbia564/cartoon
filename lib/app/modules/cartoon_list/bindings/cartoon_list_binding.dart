import 'package:get/get.dart';

import '../controllers/cartoon_list_controller.dart';

class CartoonListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartoonListController>(
      () => CartoonListController(),
    );
  }
}
