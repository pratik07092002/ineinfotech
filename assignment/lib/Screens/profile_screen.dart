import 'package:assignment/commons/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Column(children: [
        Container(
          height: 350, 
          width: MediaQuery.of(context).size.width,  
          decoration: const BoxDecoration(
          color: Color.fromARGB(255, 55, 94, 151),
            borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(30, 50) , bottomRight: Radius.elliptical(30, 50) )
          ),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Row(children: [
                IconButton(onPressed: (){
                  Get.back();
                }, icon: const Icon(Icons.arrow_back_ios ) ), 
                Text("My Profile" , style: CustomTextStyle.headline1.copyWith(color: Colors.white  ),)
              ],), 
  IconButton(onPressed: (){}, icon: const Icon(Icons.settings))
              ],),
            ), 

            const SizedBox(height: 20,) , 
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
Padding(
  padding: const EdgeInsets.all(8.0),
  child: CircleAvatar(
    radius: 60,
    child: ClipOval(
      child: Image.asset(
        "assets/profilepic4.png",
        fit: BoxFit.cover,
        width: 120, 
        height: 120,
      ),
    ),
  ),
),

Text("Pratik Gaikwad" , style: CustomTextStyle.headline2.copyWith(color: Colors.white),), 
Text("Task Manager" , style: CustomTextStyle.bodyText2.copyWith(color: Colors.white70),) , 
const SizedBox(height: 20,) , 
ElevatedButton(
        onPressed: () {
          print('Edit Profile');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255), 
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16), 
          textStyle: const TextStyle(fontSize: 14), 
        ),
        child: const Text('Edit Profile' , style: TextStyle(color: Color.fromARGB(255, 61, 105, 143), ),),
            )
            ],) 
          ],),
          ) , 
          const SizedBox(height: 20,) , 
     const ProfileTab(assetimg: "Acitivity.png" , title: "Your Activity",),
     const ProfileTab(assetimg: "SettingsBlue.png" , title: "Settings",), 

     const ProfileTab(assetimg: "Privacy.png" , title: "Privacy",),

     const ProfileTab(assetimg: "help.png" , title: "Help & Support",),

     const ProfileTab(assetimg: "logout.png" , title: "Logout",)
      ],)),
    );
  }
}


class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key, required this.assetimg, required this.title});
 final String assetimg;
 final String title;


  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          width: MediaQuery.of(context).size.width*0.9,
           child: ListTile(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
            title:  Text(title, style: const TextStyle(color: Color.fromARGB(255, 61, 105, 143),),), 
            trailing: const Icon(Icons.arrow_forward_ios_sharp , color: Color.fromARGB(255, 61, 105, 143),),
            tileColor: const Color.fromARGB(255, 243, 246, 251),
            leading: SizedBox(height: 35, width: 35,child: Image.asset("assets/$assetimg" , fit: BoxFit.fill, ) ,)
            ), 
            
         ),
    );
  }
}