import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:cartoon_sale/app/modules/sale/binding.dart';
import 'package:cartoon_sale/app/tools/app_util.dart';
import 'package:cartoon_sale/app/tools/color_tool.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/modules/add_cartoon/bindings/add_cartoon_binding.dart';
import 'app/modules/add_cartoon/views/add_cartoon_view.dart';
import 'app/modules/cartoon_list/bindings/cartoon_list_binding.dart';
import 'app/modules/cartoon_list/views/cartoon_list_view.dart';
import 'app/modules/cartoon_sale_detail/bindings/cartoon_sale_detail_binding.dart';
import 'app/modules/cartoon_sale_detail/views/cartoon_sale_detail_view.dart';
import 'app/modules/home/bindings/home_binding.dart';
import 'app/modules/home/views/car.dart';
import 'app/modules/home/views/home_view.dart';
import 'app/modules/sale/view.dart';
import 'app/modules/settings_page/bindings/settings_page_binding.dart';
import 'app/modules/settings_page/views/settings_page_view.dart';

void main() {
  runApp(_initApp());
}

Widget ceInitGetMaterialApp({
  Widget Function(BuildContext, Widget?)? builder,
}) {
  return GetMaterialApp(
    darkTheme: ThemeData.dark(),
    useInheritedMediaQuery: true,
    themeMode: ThemeMode.light,
    fallbackLocale: const Locale("zh", "CN"),
    debugShowCheckedModeBanner: false,
    initialRoute: '/create',
    getPages: GWAGES,
    defaultTransition: Transition.rightToLeft,
    theme: ThemeData(
        scaffoldBackgroundColor: PMColorUitl.pmGetColor("#FCD223"),
        indicatorColor: Colors.grey,
        brightness: Brightness.light,
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.white.withOpacity(0),
        appBarTheme:  AppBarTheme(
          systemOverlayStyle: const SystemUiOverlayStyle(
            systemNavigationBarIconBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.white,
          ),
          backgroundColor: PMColorUitl.pmGetColor("#FCD223"),
          scrolledUnderElevation: 0.0,
        ),
        bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(backgroundColor: Colors.white)),
    builder: builder,
    navigatorObservers: [BotToastNavigatorObserver()],
    supportedLocales: const [
      Locale('zh', 'CN'),
      Locale('en', 'US'),
    ],
    localizationsDelegates: const [
      GlobalWidgetsLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
  );
}

_initApp() {
  if (!kIsWeb && Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  _setBotToast();
  
  Widget body = ceInitGetMaterialApp(
    builder: (context, child) {
      final botToastBuilder = BotToastInit();
  
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        useInheritedMediaQuery: true,
        builder: (p0, p1) {
          Widget body = GestureDetector(
            onTap: () {
              PMAppUtil.keyboardDis(context);
            },
            child: child,
          );
          body = botToastBuilder(context, body);
          return body;
        },
      );
    },
  );
  return body;
}

void _setBotToast() {
  BotToast.defaultOption.notification.animationDuration =
      const Duration(seconds: 2);
}

List<GetPage<dynamic>> GWAGES = [
  GetPage(
      name: '/create',
      page: () => SaleVi(),binding: CarBinding()
  ),
  GetPage(
    name: '/home',
    page: () => const HomeView(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: '/cartoon-list',
    page: () => const CartoonListView(),
    binding: CartoonListBinding(),
  ),
  GetPage(
    name: '/cartoon-sale-detail',
    page: () => const CartoonSaleDetailView(),
    binding: CartoonSaleDetailBinding(),
  ),
  GetPage(
    name:'/settings-page',
    page: () => const SettingsPageView(),
    binding: SettingsPageBinding(),
  ),
  GetPage(
      name: '/cartoon',
      page: () => const CARPage()
  ),
  GetPage(
    name: '/add-cartoon',
    page: () => const AddCartoonView(),
    binding: AddCartoonBinding(),
  ),
];

