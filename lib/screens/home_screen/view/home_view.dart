import 'dart:developer';
import 'package:bookmybeauty/constants/images.dart';
import 'package:bookmybeauty/screens/home_screen/widgets/home_app_bar.dart';
import 'package:bookmybeauty/screens/home_screen/widgets/services_list.dart';
import 'package:bookmybeauty/screens/youtube_player/view/youtube_player.dart';
import 'package:bookmybeauty/shared/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/ktoggle_button.dart';
import '../widgets/saloon_type.dart';
import '../widgets/saloons_list.dart';
import '../widgets/trending_services.dart';
import '../widgets/video_card_widget.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    log("build method called");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               ImageSlider(
                 imagesList: [
                 saloonImage,
                 saloonImage,
                 saloonImage,
                 saloonImage,
                 saloonImage,
               ]),
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
        ),
      ),
    );
  }
}

