import 'package:assignment/commons/textstyle.dart';
import 'package:assignment/controllers/home_controller.dart';
import 'package:assignment/routes/rouenames.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:assignment/utils/custom_app_bar.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';
class GridValuesAttributes {
  final Color gridCardColor;
  final String assetimg;
  final String title;
  final String count;

  GridValuesAttributes({
    required this.title,
    required this.count,
    required this.gridCardColor,
    required this.assetimg,
  });
}
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeScreenController _homeScreenController = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_homeScreenController.isLoading.value) {
        return  Scaffold(
          appBar: AppBar(
      automaticallyImplyLeading: false,
 
      title: GestureDetector( 
        onTap: () {
          Get.toNamed(AppRouteNams.profileScreen);
        },
        child:  const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
         
         CircleAvatar(radius: 20, backgroundColor: Colors.grey, ) , 
         Padding(
           padding: EdgeInsets.all(8.0),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Hello" , style: TextStyle( fontSize: 15, color: Colors.white),) , 
            Text("Admin", style: TextStyle( fontSize: 19, fontWeight: FontWeight.w600 , color: Colors.white),)
           ],),
         )
            ],),
      ), backgroundColor: const Color.fromARGB(255, 51, 107, 166),),
          body: const ShimmerLoadingScreen(),
        );
      }

      final homeData = _homeScreenController.homeData;

final activities = _homeScreenController.latestActivityList; 
final grieviences = _homeScreenController.latestgraviencesList;
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomMainAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 300,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
                        mainAxisExtent: 120,
                      ),
                      itemBuilder: (context, index) {
                        final stats = homeData['stats'];
                        List<GridValuesAttributes> gridData = [
                          GridValuesAttributes(
                            title: "Community Manager",
                            count: stats['community_manager'].toString(),
                            gridCardColor: const Color.fromARGB(255, 62, 147, 176),
                            assetimg: "assets/communitymanager.png",
                          ),
                          GridValuesAttributes(
                            title: "Task Manager",
                            count: stats['task_managers'].toString(),
                            gridCardColor: const Color.fromARGB(255, 99, 175, 189),
                            assetimg: "assets/TaskManager.png",
                          ),
                          GridValuesAttributes(
                            title: "Total Users",
                            count: stats['total_users'].toString(),
                            gridCardColor: const Color.fromARGB(255, 96, 157, 158),
                            assetimg: "assets/users.png",
                          ),
                          GridValuesAttributes(
                            title: "Total Grievances",
                            count: stats['total_grievance'].toString(),
                            gridCardColor: const Color.fromARGB(255, 88, 126, 188),
                            assetimg: "assets/grivience.png",
                          ),
                        ];

                        final atributvalues = gridData[index];
                        return GestureDetector( 
                          onTap: () {
                            switch (index) {
                              case 0: 
                              break;
                              case 1: 
                              break ; 
                              case 2: 
                              break;
                              case 3: 
                                Get.toNamed(AppRouteNams.griveanceScreen);
                              break; 
                         
                            
                       
                                
                           
                              default:
                            }
                          },
                          child: CustomGridItem(
                            cardcolor: atributvalues.gridCardColor,
                            title: atributvalues.title,
                            count: atributvalues.count,
                            assetimg: atributvalues.assetimg,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Latest Grivience",
                    style: CustomTextStyle.headline1,
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: grieviences.length,
                    itemBuilder: (context, index) {
                      final griviance = grieviences[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 3,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            title: Text(griviance.title ?? "" , style: CustomTextStyle.headline2.copyWith(
                                  fontSize: 13,
                                  fontFamily: 'FontMain',
                                ),),
                            subtitle: Text(griviance.description ?? ""),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Latest Activity",
                    style: CustomTextStyle.headline1,
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: activities.length,
                    itemBuilder: (context, index) {
                      final activity = activities[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
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
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   CircleAvatar(
                                    radius: 25,
                                    child: Image.asset(activity.profilepic , fit: BoxFit.cover,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(activity.name ),
                                        Text(activity.username ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Icon(
                                Icons.more_vert,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 ReadMoreText(
                                  activity.description ,
                                  trimMode: TrimMode.Line,
                                  trimLines: 2,

                                  colorClickableText: Colors.blue.shade800,
                                  
                                  trimCollapsedText: 'Show more',
                                  trimExpandedText: 'Show less',
                                  moreStyle:  TextStyle(
                                    color: Colors.blue.shade800,
                                      fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: 200,
                                  child: Image.asset(
                                    activity.imageUrl ,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 15,
                                      child: Image.asset(
                                        "assets/heart.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(activity.likes.toString()),
                                    const SizedBox(width: 10),
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 15,
                                      child: Image.asset(
                                        "assets/comment.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(activity.comments.toString()),

                                    const SizedBox(width: 10),
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 15,
                                      child: Image.asset(
                                        "assets/send.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}



class CustomGridItem extends StatelessWidget {
  final String title;
  final String count;
  final Color cardcolor;
  final String assetimg;

  const CustomGridItem({
    super.key,
    required this.cardcolor,
    required this.title,
    required this.count,
    required this.assetimg,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardcolor,
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity, 
                    height: 50,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      height: 30,
                      width: 40,
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          count,
                          style: TextStyle(
                            fontFamily: 'FontMain',
                            color: cardcolor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                height: double.infinity,
                child: FittedBox(
                  child: Image.asset(assetimg),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class ShimmerLoadingScreen extends StatelessWidget {

  const ShimmerLoadingScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  crossAxisCount: 2,
                  mainAxisExtent: 120,
                ),
                itemBuilder: (context, index) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Latest Grivience",
              style: CustomTextStyle.headline1,
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true, 
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 80,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "Latest Activity",
              style: CustomTextStyle.headline1,
            ),
            const SizedBox(height: 10),
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
    );
  }
}