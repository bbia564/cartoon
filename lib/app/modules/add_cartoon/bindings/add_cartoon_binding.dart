import 'package:get/get.dart';

import '../controllers/add_cartoon_controller.dart';

class AddCartoonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCartoonController>(
      () => AddCartoonController(),
    );
  }
}
