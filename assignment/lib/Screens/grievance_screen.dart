import 'package:assignment/controllers/griveance_controller.dart';
import 'package:assignment/models/grivienceModel.dart';
import 'package:assignment/routes/rouenames.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:assignment/commons/textstyle.dart';
import 'package:shimmer/shimmer.dart';  

class GrievanceScreen extends StatelessWidget {
  const GrievanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GriveanceController controller = Get.put(GriveanceController());

    return Scaffold(
  
      appBar: AppBar(
        actions: [
               Stack(
  children: [
    IconButton(
      onPressed: () {
        Get.toNamed(AppRouteNams.notificationScreen);
      },
      icon: const Icon(Icons.notifications_outlined, color: Colors.black, size: 28),
    ),
    Positioned(
      right: 11,
      top: 11,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8),
        ),
        constraints: const BoxConstraints(
          minWidth: 4,
          minHeight: 5,
        ),
        
      ),
    ),
  ],
)

        ],
        backgroundColor: Colors.white,
        
        automaticallyImplyLeading: false,
        title: const Text("Grievances", style: CustomTextStyle.headline),
      ),
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      body: Obx(() {
        if (controller.isLoading.value) {
          return  const ShimmerLoadingList();
        }

        if (controller.GraviencesList.isEmpty) {
          return const Center(child: Text("No grievances found."));
        }

        return Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SafeArea(
                  child: Column(
                    children: controller.GraviencesList.map((grievance) {
                      return GrievanceCard(grievance: grievance);
                    }).toList(),
                  ),
                ),
              ),
            ),

              Positioned(
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: TextField(
                
                decoration: InputDecoration(
                
                  hintText: "Search",
                  
                 prefixIcon: Padding(
                   padding: const EdgeInsets.only(right :8.0),
                   child: Container(
                     decoration: BoxDecoration(
                       color: Colors.blue.shade800,
                       shape: BoxShape.circle,
                     ),
                     child: const Icon(
                       Icons.search,
                       color: Colors.white,
                       size: 25,
                     ),
                   ),
                 ),
                  suffixIcon: Icon(Icons.tune , color: Colors.blue.shade800,),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
            ),
          ),
          ],
        );
      }),
    );
  }
}

class GrievanceCard extends StatelessWidget {
  final GrivienceModel grievance;

  const GrievanceCard({required this.grievance, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            blurStyle: BlurStyle.normal,
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(grievance.title ?? "No Title", style: const TextStyle(fontFamily: 'FontMain', fontSize: 15)),
            const SizedBox(height: 8),
            Text(grievance.description ?? "No Description"),
            const SizedBox(height: 20),
            Row(
              children: [
                Flexible(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(text: "Grievance ID: ", style: CustomTextStyle.bodyText3),
                            TextSpan(text: grievance.id ?? "N/A", style: CustomTextStyle.headlineMain),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                         Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(text: "Category: ", style: CustomTextStyle.bodyText3),
                            TextSpan(text: grievance.category ?? "N/A", style: CustomTextStyle.headlineMain),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),

                    Text.rich(
  TextSpan(
    children: [
      TextSpan(
        text: " • ", 
        style: CustomTextStyle.bodyText3.copyWith(color: Colors.blue.shade800 ), 
      ),
      const TextSpan(
        text: "Assigned To: ", 
        style: CustomTextStyle.bodyText3,
      ),
      TextSpan(
        text: grievance.assignedto ?? "N/A", 
        style: CustomTextStyle.headlineMain,
      ),
    ],
  ),
),

                      const SizedBox(height: 10),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(text: "Initiated On: ", style: CustomTextStyle.bodyText3),
                            TextSpan(text: grievance.initiatedOn ?? "N/A", style: CustomTextStyle.headlineMain),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            side: BorderSide(color: Colors.blue),
                          ),
                        ),
                        onPressed: () {},
                        label: const Text("Location"),
                        icon: const Icon(Icons.my_location_outlined, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 80,
                          child: Image.asset("assets/imagesstack.png"),
                        ),
                        const SizedBox(height: 40),
                       grievance.resolved == true ?
                          Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.check_circle, color: Colors.green),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Resolved On",
                                    style: CustomTextStyle.headlineMain.copyWith(
                                      fontSize: 16  ,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                              Text(grievance.initiatedOn ?? "N/A"),
                            ],
                          ) :  Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.access_time_filled, color: Colors.yellow),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Pending",
                                    style: CustomTextStyle.headlineMain.copyWith(
                                      fontSize: 16  ,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class ShimmerLoadingList extends StatelessWidget {
  const ShimmerLoadingList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12.0),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            margin: const EdgeInsets.only(bottom: 12.0),
            height: 100.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      },
    );
  }
}