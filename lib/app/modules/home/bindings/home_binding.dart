import 'package:cartoon_sale/app/modules/cartoon_list/controllers/cartoon_list_controller.dart';
import 'package:cartoon_sale/app/modules/settings_page/controllers/settings_page_controller.dart';
import 'package:cartoon_sale/app/tools/cs_database_db.dart';
import 'package:cartoon_sale/app/tools/pm_share_per.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    CSSharedPreferences.initialize();
    CSDatabase().init();
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<CartoonListController>(
      () => CartoonListController(),
    );
    Get.lazyPut<SettingsPageController>(
      () => SettingsPageController(),
    );

  }
}
