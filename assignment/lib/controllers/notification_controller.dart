import 'dart:convert';
import 'package:assignment/models/notificationModel.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;

class NotificationController extends GetxController {
  var notificationsToday = <NotificationModel>[].obs;
  var notificationsThisWeek = <NotificationModel>[].obs;
  var loading = true.obs; 

  @override
  void onInit() {
    super.onInit();
    loadNotifications();
  }

  void loadNotifications() async {
    try {
      loading.value = true;

      String data = await rootBundle.loadString("assets/data/notifications.json");
      final jsonData = jsonDecode(data);

      if (jsonData['notificationsToday'] != null) {
        notificationsToday.value = (jsonData['notificationsToday'] as List)
            .map((e) => NotificationModel.fromJson(e))
            .toList();
      }
      if (jsonData['notificationsThisWeek'] != null) {
        notificationsThisWeek.value = (jsonData['notificationsThisWeek'] as List)
            .map((e) => NotificationModel.fromJson(e))
            .toList();
             await Future.delayed(Duration(seconds: 1));
      }
    } catch (e) {
    } finally {
      
      loading.value = false;
    }
  }
}
