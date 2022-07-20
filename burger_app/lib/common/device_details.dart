
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';

enum DevicePlatform {
  Android,
  IOS
}

class DeviceDetails{

  late DeviceInfoPlugin _deviceInfoPlugin;
  late String _deviceModel;
  late String _deviceID;
  late DevicePlatform _devicePlatform;

  Future<bool> getDeviceDetails() async {
   _deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      if(Platform.isAndroid){
        var build = await _deviceInfoPlugin.androidInfo;
        _devicePlatform = DevicePlatform.Android;
        _deviceModel = build.model;
        _deviceID = build.androidId;
      }else if(Platform.isIOS){
        var build = await _deviceInfoPlugin.iosInfo;
        _devicePlatform = DevicePlatform.IOS;
        _deviceModel = build.model;
        _deviceID = build.identifierForVendor;
      }
      return true;
    } on PlatformException {
      print('[DevicePlatformError] Failed to get platform version');
      return false;
    }
  }

  DevicePlatform getDevicePlatform() {
    return _devicePlatform;
  }

  String getDeviceModel() {
    return _deviceModel;
  }

  String getDeviceID() {
    return _deviceID;
  }
}