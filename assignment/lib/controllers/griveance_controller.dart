import 'dart:convert';
import 'package:assignment/models/grivienceModel.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;

class GriveanceController extends GetxController {
  var GraviencesList = <GrivienceModel>[].obs;
  var isLoading = true.obs; 

  @override
  void onInit() {
    super.onInit();
    griviences();
  }

  void griviences() async {
    try {
      isLoading(true); 
      String data = await rootBundle.loadString("assets/data/griviences.json");
      final jsondata = jsonDecode(data);
      if (jsondata["Grievances"] != null) {
        GraviencesList.value = (jsondata["Grievances"] as List)
            .map((e) => GrivienceModel.fromJson(e))
            .toList();
        print("Grievances loaded successfully: ${GraviencesList.length}");
      } else {
        print("No grievances found in the JSON data.");
      }
             await Future.delayed(const Duration(seconds: 1));

    } catch (e) {
      print("Error loading grievances: $e");
    } finally {
      isLoading(false); 
    }
  }
}
