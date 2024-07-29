import 'package:cartoon_sale/app/tools/color_tool.dart';
import 'package:cartoon_sale/app/tools/componets.dart';
import 'package:cartoon_sale/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/settings_page_controller.dart';

class SettingsPageView extends GetView<SettingsPageController> {
  const SettingsPageView({Key? key}) : super(key: key);

  Widget _itemCount(String up, String down) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        pmGetText(up, fontSize: 20),
        2.verticalSpace,
        pmGetText(down,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            textColor: PMColorUitl.pmGetColor("#747474"))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      "Clean sales",
      "Clean Cartoons",
      "Share",
      "Version"
    ];
    return Scaffold(
      appBar: AppBar(
        title: pmGetText("Settings"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          pmGetContainer(
              radius: 10.w,
              height: 80.w,
              margin: EdgeInsets.all(16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() =>
                      _itemCount(controller.totalC.toString(), "Total Sales")),
                  Obx(() =>
                      _itemCount(controller.totalP.toString(), "Revenue")),
                  Obx(() =>
                      _itemCount(controller.todayP.toString(), "Today Revenue"))
                ],
              )),
          Expanded(
              child: pmGetContainer(
                  radius: 10.w,
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  child: ListView.separated(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.w),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            controller.cellClick(index);
                          },
                          child: SizedBox(
                          height: 44.w,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              pmGetText(items[index], fontSize: 14),
                              const Spacer(),
                              Image.asset(
                                Assets.arrow,
                                height: 16.w,
                                width: 16.w,
                              )
                            ],
                          ),
                        ),
                        );
                      },
                      separatorBuilder: (context, index) => pmDivider(),
                      itemCount: items.length)))
        ],
      ),
    );
  }
}
