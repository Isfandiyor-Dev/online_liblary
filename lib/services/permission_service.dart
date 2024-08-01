import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  static Future<bool> requestStoragePermission() async {
    if (Platform.isAndroid) {
      print("BU android");
      final isGranted = await Permission.storage.isGranted;
      if (!isGranted) {
        await Permission.storage.request();
        print("Ruxsat so'raldi");
      }
      return isGranted;
    }

    final isGranted = await Permission.storage.isGranted;
    if (!isGranted) {
      await Permission.storage.request();
    }

    return isGranted;
  }
}
