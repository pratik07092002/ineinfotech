import 'package:assignment/controllers/home_controller.dart';
import 'package:assignment/routes/rouenames.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomMainAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomMainAppBar({super.key});
  @override
  Size get preferredSize =>  const Size.fromHeight(70.0);
  @override
  Widget build(BuildContext context) {
  final HomeScreenController _homeScreenController = Get.put(HomeScreenController());

    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
   Stack(
  children: [
    IconButton(
      onPressed: () {
        Get.toNamed(AppRouteNams.notificationScreen);
      },
      icon: const Icon(Icons.notifications_outlined, color: Colors.white, size: 28),
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
      title: GestureDetector( 
        onTap: () {
          Get.toNamed(AppRouteNams.profileScreen);
        },
        child:  Row(
          mainAxisSize: MainAxisSize.min,
          children: [
         
         CircleAvatar(radius: 20, backgroundColor: Colors.grey, child: ClipOval(
          
          child: Image.asset(_homeScreenController.profilepic.value)),) , 
         Padding(
           padding: EdgeInsets.all(8.0),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Hello" , style: TextStyle( fontSize: 15, color: Colors.white),) , 
            Text(_homeScreenController.userName.value , style: TextStyle( fontSize: 19, fontWeight: FontWeight.w600 , color: Colors.white),)
           ],),
         )
            ],),
      ), backgroundColor: const Color.fromARGB(255, 51, 107, 166),);
  }
}
