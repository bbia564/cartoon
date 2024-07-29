import 'dart:convert';

import 'package:cartoon_sale/app/tools/app_util.dart';
import 'package:cartoon_sale/app/tools/color_tool.dart';
import 'package:cartoon_sale/app/tools/componets.dart';
import 'package:cartoon_sale/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/add_cartoon_controller.dart';

class AddCartoonView extends GetView<AddCartoonController> {
  const AddCartoonView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: pmGetText("Stock"),
        centerTitle: true,
      ),
      body: pmGetContainer(
          radius: 10.w,
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          margin: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                6.verticalSpace,
                pmGetText(" Select Cover",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textColor: PMColorUitl.pmGetColor("#6A6A6A")),
                12.verticalSpace,
                InkWell(
                    onTap: controller.selectPic,
                    child: Obx(() => controller.imageData.isEmpty
                        ? pmGetContainer(
                            radius: 8.w,
                            width: 96.w,
                            height: 96.w,
                            alignment: Alignment.center,
                            color: PMColorUitl.pmGetColor("#F7F7F7"),
                            child: Image.asset(
                              Assets.photoPlc,
                              height: 26.h,
                              width: 26.w,
                            ))
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(8.w),
                            child: Image.memory(
                              base64Decode(controller.imageData.value),
                              width: 96.w,
                              height: 96.h,
                              fit: BoxFit.cover,
                            ),
                          ))),
                6.verticalSpace,
                pmGetText(" Cartoon Name", fontSize: 14),
                6.verticalSpace,
                _inputView(
                    inputContro: controller.nameInputcontol,
                    plsStr: "input cartoon name"),
                14.verticalSpace,
                pmGetText(" Public Date", fontSize: 14),
                6.verticalSpace,
                InkWell(
                  onTap: controller.selectDate,
                  child: pmGetContainer(
                      radius: 4.w,
                      height: 46.w,
                      width: double.infinity,
                      borderColor: PMColorUitl.pmGetColor("#DBDBDB"),
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Obx(() => controller.date.value != null
                              ? pmGetText(
                                  PMAppUtil.formatDateWithoutHour(
                                      dateTime: controller.date.value!),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16)
                              : pmGetText("  select Date",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  textColor:
                                      PMColorUitl.pmGetColor("#8C8C8C"))),
                          const Spacer(),
                          Image.asset(
                            Assets.arrow,
                            height: 18.w,
                            width: 18.w,
                          ),
                        ],
                      )),
                ),
                14.verticalSpace,
                pmGetText("  Selling price", fontSize: 14),
                6.verticalSpace,
                pmGetContainer(
                    radius: 4.w,
                    height: 46.w,
                    width: double.infinity,
                    borderColor: PMColorUitl.pmGetColor("#DBDBDB"),
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    alignment: Alignment.center,
                    child: Row(mainAxisSize: MainAxisSize.max, children: [
                      InkWell(
                        onTap: () {
                          controller.prince.value++;
                        },
                        child: Image.asset(
                          Assets.iconIncj,
                          height: double.infinity,
                          width: 36.w,
                        ),
                      ),
                      Expanded(
                          child: Obx(() => pmGetText(
                              controller.prince.value.toString(),
                              textAline: TextAlign.center))),
                      InkWell(
                        onTap: () {
                          if (controller.prince.value <= 0) {
                            return;
                          }
                          controller.prince.value--;
                        },
                        child: Image.asset(
                          Assets.iconJj,
                          height: double.infinity,
                          width: 36.w,
                        ),
                      ),
                    ])),
                14.verticalSpace,
                pmGetText("  Inventory", fontSize: 14),
                6.verticalSpace,
                pmGetContainer(
                    radius: 4.w,
                    height: 46.w,
                    width: double.infinity,
                    borderColor: PMColorUitl.pmGetColor("#DBDBDB"),
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    alignment: Alignment.center,
                    child: Row(mainAxisSize: MainAxisSize.max, children: [
                      InkWell(
                        onTap: () {
                          controller.count.value++;
                        },
                        child: Image.asset(
                          Assets.iconIncj,
                          height: double.infinity,
                          width: 36.w,
                        ),
                      ),
                      Expanded(
                          child: Obx(() => pmGetText(
                              controller.count.value.toString(),
                              textAline: TextAlign.center))),
                      InkWell(
                          onTap: () {
                            if (controller.count.value <= 0) {
                              return;
                            }
                            controller.count.value--;
                          },
                          child: Image.asset(
                            Assets.iconJj,
                            height: double.infinity,
                            width: 36.w,
                          ))
                    ])),
                24.verticalSpace,
                InkWell(
                  onTap: controller.submit,
                  child: pmGetContainer(
                    radius: 4.w,
                    height: 44.w,
                    width: double.infinity,
                    color: Colors.black,
                    alignment: Alignment.center,
                    child: pmGetText("Submit",
                        fontSize: 14, textColor: Colors.white),
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget _inputView(
      {TextEditingController? inputContro,
      TextInputType? keyboardType,
      int? maxLength,
      String? plsStr}) {
    return pmGetContainer(
        radius: 4.w,
        height: 46.w,
        width: double.infinity,
        borderColor: PMColorUitl.pmGetColor("#DBDBDB"),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        alignment: Alignment.center,
        child: TextField(
            controller: inputContro,
            keyboardType: keyboardType,
            textAlign: TextAlign.left,
            maxLength: maxLength,
            maxLines: 1,
            style: TextStyle(color: Colors.black, fontSize: 16.sp),
            decoration: InputDecoration(
                counterText: "",
                border: InputBorder.none,
                hintText: plsStr ?? 'input',
                hintStyle: TextStyle(
                    color: PMColorUitl.pmGetColor('#8C8C8C'),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal))));
  }
}
