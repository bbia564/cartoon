import 'dart:convert';

import 'package:cartoon_sale/app/modules/cartoon_sale_detail/views/sale_view.dart';
import 'package:cartoon_sale/app/tools/cartoon_model.dart';
import 'package:cartoon_sale/app/tools/color_tool.dart';
import 'package:cartoon_sale/app/tools/componets.dart';
import 'package:cartoon_sale/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CartoonCell extends StatelessWidget {
  final CartoonModel model;
  const CartoonCell({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final isLocaImg = model.photo?.isEmpty ?? true;
    return pmGetContainer(
        radius: 10.w,
        // height: 164.w,
        margin: EdgeInsets.only(bottom: 10.w),
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
                : Image.memory(base64Decode(model.photo!),
                    height: 142.w, width: 96.w,fit: BoxFit.cover,),
            10.horizontalSpace,
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 42.w,
                  child: Row(
                    children: [
                      Expanded(
                          child: pmGetText(model.name ?? "",
                              fontSize: 14, maxlenght: 2)),
                      5.horizontalSpace,
                      Image.asset(
                        Assets.arrow,
                        height: 18.w,
                        width: 18.w,
                      )
                    ],
                  ),
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
                              textColor: PMColorUitl.pmGetColor("#747474")),
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
                              textColor: PMColorUitl.pmGetColor("#747474")),
                          4.verticalSpace,
                          pmGetText("${model.amount}", fontSize: 12),
                        ],
                      )
                    ],
                  ),
                ),
                14.verticalSpace,
                SizedBox(
                  height: 36.w,
                  width: double.infinity,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                          flex: 1,
                          child: pmGetContainer(
                            radius: 4.w,
                            borderColor: Colors.black,
                            alignment: Alignment.center,
                            child: pmGetText("Sales record", fontSize: 12),
                          )),
                      10.horizontalSpace,
                      Flexible(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              Get.dialog(
                                SaleView(model: model),
                              );
                            },
                            child: pmGetContainer(
                              radius: 4.w,
                              color: Colors.black,
                              alignment: Alignment.center,
                              child: pmGetText("Sale",
                                  fontSize: 12, textColor: Colors.white),
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ))
          ],
        ));
  }
}
