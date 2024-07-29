import 'package:cartoon_sale/app/modules/cartoon_list/views/cartoon_cell.dart';
import 'package:cartoon_sale/app/tools/color_tool.dart';
import 'package:cartoon_sale/app/tools/componets.dart';
import 'package:cartoon_sale/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/cartoon_list_controller.dart';

class CartoonListView extends GetView<CartoonListController> {
  const CartoonListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: pmGetText("Cartoons"),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: (){
              Get.toNamed('/add-cartoon');
            },
            child: Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Image.asset(
                Assets.flotingAdd,
                height: 20.w,
                width: 20.w,
              ),
            ),
          )
        ],
      ),
      body: Obx(() => controller.allCartoons.isEmpty
          ?  Center(
              child: pmGetText("No Data",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  textColor: PMColorUitl.pmGetColor("#999999")),
            )
          :  ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: controller.allCartoons.length,
              itemBuilder: (context, index) {
                final item = controller.allCartoons[index];
                return InkWell(
                  onTap: () {
                    Get.toNamed('/cartoon-sale-detail',arguments: {"model":item});
                  },
                  child: CartoonCell(model: item),
                );
              },
            )),
    );
  }
}
