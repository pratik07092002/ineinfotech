import 'package:assignment/Screens/grievance_screen.dart';
import 'package:assignment/Screens/home_screen.dart';
import 'package:assignment/Screens/login_screen.dart';
import 'package:assignment/Screens/notifications_screen.dart';
import 'package:assignment/Screens/profile_screen.dart';
import 'package:assignment/Screens/verification_screen.dart';
import 'package:assignment/routes/rouenames.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRouteConfiguration{
  static List<GetPage> routes = [
    GetPage(name: AppRouteNams.homeScreen,
    transition: Transition.leftToRight,
     page: () =>  HomeScreen()) , 
      GetPage(name: AppRouteNams.loginScreen,
    transition: Transition.leftToRight,
     page: () =>  const LoginScreen()), 
           GetPage(name: AppRouteNams.profileScreen,
    transition: Transition.leftToRight,
     page: () =>  const ProfileScreen()) , 
         GetPage(name: AppRouteNams.notificationScreen,
    transition: Transition.leftToRight,
     page: () =>   NotificationsScreen()) , 
     GetPage(name: AppRouteNams.verifyScreen,
    transition: Transition.leftToRight,
     page: () =>   const VerificationScreen()) , 
        GetPage(name: AppRouteNams.griveanceScreen,
    transition: Transition.leftToRight,
     page: () =>   GrievanceScreen())
  ];
}