import 'dart:convert';
import 'package:assignment/models/activity_model.dart';
import 'package:assignment/models/grivienceModel.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  RxBool isLoading = true.obs;
  RxMap homeData = {}.obs;
  var latestgraviencesList = <GrivienceModel>[].obs;
  var latestActivityList = <ActivityModel>[].obs;
 var userName = "".obs;
var profilepic = "".obs;

  @override
  void onInit() {
    fetchHomeData();
    super.onInit();
  }

  Future<void> fetchHomeData() async {
    try {
      isLoading(true);
      final String response = await rootBundle.loadString('assets/data/home_data.json');
      homeData.value = json.decode(response);
   latestgraviencesList.value = (homeData['latest_grievances'] as List)
      .map((grievanceData) => GrivienceModel.fromJson(grievanceData))
      .toList();
     // print("home Data is ${grievances.first.description}");
      latestActivityList.value = (homeData['latest_activity'] as List).map((activity) => ActivityModel.fromJson(activity) ,).toList();
   profilepic.value = homeData["admin"]["avatar_url"];
   userName.value = homeData["admin"]["name"];

             await Future.delayed(const Duration(seconds: 1));

    } catch (e) {
      Get.snackbar('Error', 'Failed to load data');
    } finally {
      isLoading(false);
    }
  }
}
