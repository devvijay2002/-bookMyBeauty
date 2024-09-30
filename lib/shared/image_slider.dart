import 'package:bookmybeauty/constants/colors.dart';
import 'package:bookmybeauty/global_controllers/shared_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ImageSlider extends StatefulWidget {
  final List<String> imagesList;
  const ImageSlider({super.key,required this.imagesList});

  @override
  ImageSliderState createState() => ImageSliderState();
}

class ImageSliderState extends State<ImageSlider> {
  final CarouselSliderController carouselController = CarouselSliderController();
    var sharedController = Get.find<SharedController>();



  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          items: widget.imagesList.map((item) {
            return Container(
              height: Get.height * 0.4,
              width: Get.width,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Image.asset(
                item,
                fit: BoxFit.cover, // Ensure the image covers the entire area
              ),
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
        ),
        Obx(() {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.imagesList.asMap().entries.map((entry) {
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
    );
  }
}
