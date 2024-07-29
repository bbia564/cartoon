import 'package:cartoon_sale/app/tools/color_tool.dart';
import 'package:cartoon_sale/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: PageView(
            controller: controller.pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (value) {
              controller.currentIndex.value = value;
            },
            children: controller.pageList,
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.h)),
              onPressed: controller.showAddView,
              child: Image.asset(
                Assets.flotingAdd,
                height: 44.w,
                width: 44.w,
              )),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            fixedColor: Colors.black,
            onTap: (value) {
              if (value == 1) {
                controller.showAddView();
                return;
              }
              controller.currentIndex.value = value;
              controller.pageController.jumpToPage(value);
            },
            items: [
              BottomNavigationBarItem(
                  icon: _tbTbarItem(Assets.homeNormal),
                  activeIcon: _tbTbarItem(Assets.homeSelected),
                  label: "Sale"),
              BottomNavigationBarItem(
                  icon: _tbTbarItem(Assets.addWhite),
                  activeIcon: _tbTbarItem(Assets.addWhite),
                  label: "Stock"),
              BottomNavigationBarItem(
                label: "Mine",
                icon: _tbTbarItem(Assets.setNormal),
                activeIcon: _tbTbarItem(Assets.setSelected),
              )
            ],
          ),
        ));
  }

  Widget _tbTbarItem(String name) {
    return Image.asset(
      name,
      height: 22.h,
      width: 22.h,
      fit: BoxFit.cover,
    );
  }
}
