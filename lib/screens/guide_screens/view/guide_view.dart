import 'package:bookmybeauty/constants/images.dart';
import 'package:bookmybeauty/screens/login_screen/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/guide_tour_controller.dart';

class GuideTourScreen extends StatelessWidget {
  GuideTourScreen({super.key});

  final GuideTourController guideTourController = Get.find<GuideTourController>();
  final List<Map<String, String>> guideData = [
    {
      "title": "Find Nearby Salon",
      "description": "Reference site about Lorem giving information on its origins, as well random generator.",
      "image": gdTourImage1
    },
    {
      "title": "Bridal Makeup",
      "description": "Reference site about Lorem giving information on its origins, as well random generator.",
      "image": gdTourImage2
    },
    {
      "title": "Salon Services at Home",
      "description": "Reference site about Lorem giving information on its origins, as well random generator.",
      "image": gdTourImage3
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: guideTourController.pageController,
              onPageChanged: guideTourController.updatePage,
              itemCount: guideData.length,
              itemBuilder: (context, index) {
                return Container(
                  width: Get.width,
                  height: Get.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(guideData[index]['image']!),
                     fit: BoxFit.fill
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: Get.height * 0.27),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          guideData[index]['title']!,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            guideData[index]['description']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Positioned(
              bottom: Get.height * 0.17,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  guideData.length,
                      (index) => Obx(() => buildDot(index, context)),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: TextButton(
                onPressed: () {
                  // Skip logic here
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
                ),
              ),
            ),
             Positioned(
              bottom: -40,
              right: -10,
              child: GestureDetector(
                onTap: () {
                  if (guideTourController.currentPage.value == guideData.length - 1) {
               //     Navigator.pushNamed(context, Routes.loginPageRoute);
                    Get.to(() => const LoginView(),
                      transition: Transition.fadeIn, // Choose the desired transition
                      duration: const Duration(milliseconds: 300), // Optional: Customize the duration
                    );
                  } else {
                    guideTourController.nextPage();
                  }
                },
                child: Container(
                  height: 150,
                  width: Get.width*0.26,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/icons/next_button_bg2.png"))
                  ),
                    child:  Center(
                      child: Obx(
                            () => Text(
                          guideTourController.currentPage.value == guideData.length - 1
                              ? "Finish"
                              : "Next",
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                          ),
              )
             ),

            /* Positioned(
              bottom: -10,
              right: -10,
              child: Transform.rotate(
                angle: 0 * (pi / 180),
                child: GestureDetector(
                  onTap: () {
                    if (guideTourController.currentPage.value == guideData.length - 1) {
                      // Go to next screen logic
                    } else {
                      guideTourController.nextPage();
                    }
                  },
                  child: Container(
                    height: 70,
                    width: 100,
                    decoration: const BoxDecoration(
                      color: Color(0xffbd1112),
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.elliptical(70, 60),
                        bottomStart: Radius.elliptical(4, 40),
                        topEnd: Radius.elliptical(80, 14),
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    child: Center(
                      child: Obx(
                            () => Text(
                          guideTourController.currentPage.value == guideData.length - 1
                              ? "Finish"
                              : "Next",
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      height: 3,
      width: 60,
      decoration: BoxDecoration(
        color: guideTourController.currentPage.value >= index ? Colors.red : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
