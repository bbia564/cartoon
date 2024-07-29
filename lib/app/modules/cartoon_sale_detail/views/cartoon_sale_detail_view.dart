import 'dart:convert';

import 'package:cartoon_sale/app/modules/cartoon_sale_detail/views/sale_view.dart';
import 'package:cartoon_sale/app/tools/color_tool.dart';
import 'package:cartoon_sale/app/tools/componets.dart';
import 'package:cartoon_sale/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/cartoon_sale_detail_controller.dart';

class CartoonSaleDetailView extends GetView<CartoonSaleDetailController> {
  const CartoonSaleDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = controller.model;
    final isLocaImg = model.photo?.isEmpty ?? true;
    return Scaffold(
      appBar: AppBar(
        title: pmGetText("Sales record"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          pmGetContainer(
              radius: 10.w,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              padding: EdgeInsets.all(10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  isLocaImg
                      ? Image.asset(
                          model.localPhoto!,
                          height: 142.w,
                          width: 96.w,
                          fit: BoxFit.cover,
                        )
                      : Image.memory(
                          base64Decode(model.photo!),
                          height: 142.w,
                          width: 96.w,
                          fit: BoxFit.cover,
                        ),
                  10.horizontalSpace,
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 42.w,
                        child: pmGetText(model.name ?? "",
                            fontSize: 14, maxlenght: 2),
                      ),
                      4.verticalSpace,
                      pmDivider(),
                      8.verticalSpace,
                      SizedBox(
                        height: 42.w,
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                pmGetText("Pub-Date",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    textColor:
                                        PMColorUitl.pmGetColor("#747474")),
                                4.verticalSpace,
                                Expanded(
                                    child: pmGetText(model.pubTime ?? "",
                                        fontSize: 12, maxlenght: 1)),
                              ],
                            ),
                            20.horizontalSpace,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                pmGetText("Amount",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    textColor:
                                        PMColorUitl.pmGetColor("#747474")),
                                4.verticalSpace,
                                pmGetText("${model.amount}", fontSize: 12),
                              ],
                            )
                          ],
                        ),
                      ),
                      14.verticalSpace,
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              pmGetText("Price",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  textColor: PMColorUitl.pmGetColor("#747474")),
                              2.verticalSpace,
                              pmGetText("${model.price}", fontSize: 12),
                            ],
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              Get.dialog(
                                SaleView(model: model),
                              );
                            },
                            child: pmGetContainer(
                              radius: 4.w,
                              height: 36.w,
                              width: 100.w,
                              color: Colors.black,
                              alignment: Alignment.center,
                              child: pmGetText("Sale",
                                  fontSize: 12, textColor: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))
                ],
              )),
          Expanded(
              child: pmGetContainer(
                  radius: 10.w,
                  margin: EdgeInsets.all(16.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.w),
                  child: Obx(() => controller.sales.isEmpty
                      ? Center(
                          child: pmGetText("no datas",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              textColor: PMColorUitl.pmGetColor("#999999")),
                        )
                      : ListView.separated(
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            final item = controller.sales[index];
                            return SizedBox(
                              height: 44.w,
                              child: Row(
                                children: [
                                  pmGetText(item.saleDate ?? "",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                  const Spacer(),
                                  pmGetText(
                                      "${item.amount}(${model.price! * item.amount!})",
                                      fontSize: 14),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => pmDivider(),
                          itemCount: controller.sales.length))))
        ],
      ),
    );
  }
}
