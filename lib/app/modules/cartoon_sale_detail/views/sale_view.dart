import 'dart:convert';
import 'package:cartoon_sale/app/modules/cartoon_sale_detail/controllers/sale_controller.dart';
import 'package:cartoon_sale/app/tools/cartoon_model.dart';
import 'package:cartoon_sale/app/tools/color_tool.dart';
import 'package:cartoon_sale/app/tools/componets.dart';
import 'package:cartoon_sale/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SaleView extends StatelessWidget {
  final CartoonModel model;
  const SaleView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    print("--- ${model.price} ${model.name}");
    final isLocaImg = model.photo?.isEmpty ?? true;
    return GetBuilder<SaleController>(
      init: SaleController(),
      builder: (controller) {
        
        controller.cid = model.id!;
        return Material(
          color: Colors.transparent,
          child: Center(
            child: pmGetContainer(
                radius: 10.w,
                width: 300.w,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    14.verticalSpace,
                    pmGetText("Sale", fontSize: 14),
                    14.verticalSpace,
                    SizedBox(
                      height: 50.w,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          6.horizontalSpace,
                          isLocaImg
                              ? Image.asset(
                                  model.localPhoto!,
                                  height: 142.w,
                                  width: 96.w,
                                  fit: BoxFit.cover,
                                )
                              : Image.memory(
                                  base64Decode(model.photo!),
                                  height: 42.w,
                                  width: 30.w,
                                  fit: BoxFit.cover,
                                ),
                          10.horizontalSpace,
                          Expanded(
                              child: pmGetText(model.name ?? "",
                                  fontSize: 14, maxlenght: 2)),
                          6.verticalSpace,
                        ],
                      ),
                    ),
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
                              controller.price.value =
                                  model.price! * controller.count.value;
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
                                controller.price.value =
                                    model.price! * controller.count.value;
                              },
                              child: Image.asset(
                                Assets.iconJj,
                                height: double.infinity,
                                width: 36.w,
                              ))
                        ])),
                    18.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        pmGetText("Total",
                            fontSize: 14, fontWeight: FontWeight.w400),
                        10.horizontalSpace,
                        Obx(() => pmGetText(controller.price.toString(),
                            fontSize: 14))
                      ],
                    ),
                    12.verticalSpace,
                    pmDivider(),
                    SizedBox(
                      height: 48.w,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                              flex: 1,
                              child: InkWell(
                                onTap: Get.back,
                                child: pmGetContainer(
                                radius: 4.w,
                                alignment: Alignment.center,
                                child: pmGetText("Cancel",
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),)),
                          Container(
                            height: 36.w,
                            width: 1.w,
                            color: PMColorUitl.pmGetColor("#EFEFEF"),
                          ),
                          Flexible(
                              flex: 1,
                              child: InkWell(
                                onTap: controller.submit,
                                child: pmGetContainer(
                                  radius: 4.w,
                                  alignment: Alignment.center,
                                  child: pmGetText("OK", fontSize: 14),
                                ),
                              )),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        );
      },
    );
  }
}
