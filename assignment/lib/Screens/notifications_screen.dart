import 'package:assignment/commons/textstyle.dart';
import 'package:assignment/controllers/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final NotificationController controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.loading.value) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 251, 251, 251),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            title: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                const Text(
                  'Notifications',
                  style: TextStyle(fontFamily: 'FontMain', fontSize: 16),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 20,
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 200,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 20,
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 200,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 251, 251, 251),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            title: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                const Text(
                  'Notifications',
                  style: TextStyle(fontFamily: 'FontMain', fontSize: 16),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                            text: "You Have ",
                            style: CustomTextStyle.bodyText2),
                        TextSpan(
                            text: "${controller.notificationsToday.length} Notifications",
                            style: CustomTextStyle.bodyText2
                                .copyWith(color: Colors.blue.shade800)),
                        const TextSpan(
                            text: " Today",
                            style: CustomTextStyle.bodyText2),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Today', style: TextStyle(fontFamily: 'FontMain')),
                  const SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.notificationsToday.length,
                    itemBuilder: (context, index) {
                      final notification = controller.notificationsToday[index];
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ListTile(
                          tileColor: const Color.fromARGB(255, 255, 255, 255),
                          leading:  CircleAvatar(radius: 15 , child: ClipOval(
                            child: Image.asset(notification.userImage , fit: BoxFit.cover,)) ,),
                          title: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: notification.userName,
                                    style: CustomTextStyle.bodyText
                                        .copyWith(color: Colors.blue.shade800, fontSize: 12)),
                                const TextSpan(text: ' '),
                                TextSpan(
                                    text: notification.action,
                                    style: CustomTextStyle.bodyText2),
                              ],
                            ),
                          ),
                          trailing: Text(notification.timeAgo),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text('This Week', style: TextStyle(fontFamily: 'FontMain')),
                  const SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.notificationsThisWeek.length,
                    itemBuilder: (context, index) {
                      final notification = controller.notificationsThisWeek[index];
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ListTile(
                          
                          tileColor: const Color.fromARGB(255, 255, 255, 255),
                          leading:  CircleAvatar(radius: 15 , child: ClipOval(
                            
                            child: Image.asset(notification.userImage , fit: BoxFit.cover,
                         
                            )),),
                          title: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: notification.userName,
                                    style: CustomTextStyle.bodyText
                                        .copyWith(color: Colors.blue.shade800, fontSize: 12)),
                                const TextSpan(text: ' '),
                                TextSpan(
                                    text: notification.action,
                                    style: CustomTextStyle.bodyText2),
                              ],
                            ),
                          ),
                          trailing: Text(notification.timeAgo),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
