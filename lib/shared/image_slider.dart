import 'package:bookmybeauty/constants/colors.dart';
import 'package:bookmybeauty/global_controllers/shared_controller.dart';
import 'package:bookmybeauty/screens/home/controller/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';


class ImageSlider extends StatefulWidget {


  const ImageSlider({super.key});

  @override
  ImageSliderState createState() => ImageSliderState();
}

class ImageSliderState extends State<ImageSlider> {
  final CarouselSliderController carouselController = CarouselSliderController();
    var sharedController = Get.find<SharedController>();
    var homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return homeController.bannerImageList.isNotEmpty? Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Obx(() {
            return CarouselSlider(
              items: homeController.bannerImageList.map((item) {
                return Container(
                  height: Get.height * 0.4,
                  width: Get.width,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: Image.network(
                    item,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return  Shimmer.fromColors(
                          baseColor: kBaseColor,
                          highlightColor: khighlightColor,
                          child: Container(
                            height: Get.height * 0.2,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        );
                      }
                    },
                  )
                );
              }).toList(),
              carouselController: carouselController,
              options: CarouselOptions(
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 8),
                aspectRatio: 16 / 8,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  sharedController.updateImageIndex(index: index);
                },
              ),
            );
          }
        ),
        Obx(() {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: homeController.bannerImageList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => carouselController.animateToPage(entry.key),
                    child: Container(
                      width: Get.width/360*10,
                      height: Get.width/360*10,
                      margin: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: sharedController.currentIndex.value == entry.key ?kPrimaryColor : Colors.white
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          }
        ),
      ],
    )
        :
    Container(
      height: Get.height * 0.2,
      width: Get.width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),

      child: Shimmer.fromColors(
        baseColor: kBaseColor,
        highlightColor: khighlightColor,
        child: Container(
          height: Get.height * 0.2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );

  }
}
