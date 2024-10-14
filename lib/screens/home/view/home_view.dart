import 'dart:developer';
import 'package:bookmybeauty/api_service/dashboard_api.dart';
import 'package:bookmybeauty/constants/images.dart';
import 'package:bookmybeauty/model/dashboard_model.dart';
import 'package:bookmybeauty/screens/home/controller/home_controller.dart';
import 'package:bookmybeauty/shared/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../components/ktoggle_button.dart';
import '../../../routes/routes.dart';
import '../../../shared/left_drawer.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/saloon_type.dart';
import '../widgets/saloons_list.dart';
import '../widgets/services_list.dart';
import '../widgets/trending_services.dart';
import '../widgets/video_card_widget.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey leftDrawer = GlobalKey();
var homeController = Get.find<HomeController>();
  Future<void>_onRefresh()async{
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    log("build method called");
    return Scaffold(
      key: homeScaffoldKey,
      backgroundColor: Colors.white,
      appBar: HomeAppBar(
        homeScaffoldKey: homeScaffoldKey,
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          child: FutureBuilder<DashboardModel?>(
            future: DashboardAPI.getDashboardData(
                data:{
              "saloonType":1,
              "visitType":1
            }),
            builder: (context,snapshot) {
              if(snapshot.hasData){
                var dashboardResult =snapshot.data;
                  if(dashboardResult !=null){
                    List<String> imageList =[];
                    dashboardResult.banners?.forEach((element) {
                      imageList.add(element['image']);
                    },);
                    homeController.updateBannerImageList(imageList: imageList);
             return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImageSlider(),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Looking For",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          KToggleButton(),
                        ],
                      ),
                      SizedBox(height: 20),
                      SaloonTypeWidget(),
                      TrendingServiceWidget(
                        serviceImages: [
                          girlImage,
                          girlImage,
                          girlImage,
                        ],
                      ),
                      ServiceListWidget(
                        serviceImages: [
                          girlImage2,
                          girlImage2,
                          girlImage2,
                        ],
                        serviceTitles: [
                          "Hair Cut",
                          "Hair Cut",
                          "Hair Cut",
                        ],
                      ),
                    ],
                  ),
                ),
                const SaloonsListWidget(),
                Container(
                  height: Get.height*0.15,
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      image:const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(bookAppointmentBackground)
                      )
                  ),
                ),

                /*    const Padding(
                   padding: EdgeInsets.all(16.0),
                   child: YoutubePlays(),
                 )*/

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
                  child: VideoCardWidget(
                    imageUrl: "https://i.pinimg.com/564x/85/de/49/85de492bbb0da1b12010eacae294a6c5.jpg", // replace with your actual image URL or asset
                    title: 'Beauty Make-up',
                    viewCount: '3.6K views',
                    timeAgo: '7 months ago',
                    description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                  ),
                ),
              ],
            );
                    }

              }
             return SizedBox(
               height: Get.height*0.9,
               width: Get.width,
               child: Center(
                 child: LottieBuilder.asset(
                   width: Get.width*0.28,
                   height:Get.width*0.28,
                   fit: BoxFit.cover,
                   loading2,
                 ),
               ),
             );
            }
          ),
        ),
      ),
      drawer: LeftDrawer(key: leftDrawer),
    );
  }
}

