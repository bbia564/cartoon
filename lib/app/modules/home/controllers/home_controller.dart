import 'package:cartoon_sale/app/modules/cartoon_list/views/cartoon_list_view.dart';
import 'package:cartoon_sale/app/modules/settings_page/views/settings_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;
  final PageController pageController = PageController(initialPage: 0);
  List<Widget> pageList = [
    const CartoonListView(),
    Container(),
    const SettingsPageView(),
  ];

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

  void changeCurrentPageIndex(int index) {
    currentIndex.value = index;
  }

  void showAddView() {
    Get.toNamed('/add-cartoon');
  }
}
