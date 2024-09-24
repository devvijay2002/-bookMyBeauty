
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../components/kcustom_button.dart';
import '../../../components/ktext_form_field.dart';
import '../../../constants/colors.dart';
import '../../../constants/images.dart';

class SaloonsListWidget extends StatefulWidget {
  const SaloonsListWidget({super.key});

  @override
  SaloonsListWidgetState createState() => SaloonsListWidgetState();
}

class SaloonsListWidgetState extends State<SaloonsListWidget> {
  final PageController _pageController = PageController(viewportFraction: 0.7);
  TextEditingController searchSaloonController = TextEditingController();
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      saloonImage,
      saloonImage,
      saloonImage,
      saloonImage,
      saloonImage,
    ];
    List<String> titles = [
      "Saloon1",
      "Saloon2",
      "Saloon3",
      "Saloon4",
      "Saloon5",
    ];

    return SingleChildScrollView(
      child: Container(
        color: dimRedColor,
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    KTextFormField(controller: searchSaloonController,isBorderSide: false,fillColor: Colors.white70,filled: true,hintText: "Search Saloon",),
                    SizedBox(
                        width: Get.width*0.28,
                        child: const KCustomButton(buttonText: "Search",verticalPadding: 12,textStyle: TextStyle(fontSize: 14,color: Colors.white),))
                  ],
                )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Center East Delhi',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {
                      // Implement navigation to all services
                    },
                    child: const Text('View All',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),

            ExpandablePageView.builder(
              controller: _pageController,
              animateFirstPage: true,
              estimatedPageSize: 100,
              itemCount: images.length,
              itemBuilder: (context, index) {
                final double scale = (_currentPage - index).abs().clamp(0.0, 1.0);
                final double currentScale = 1 - (scale * 0.1);
                final double currentOpacity = 1 - (scale * 0.5);

                return Transform.scale(
                  scale: currentScale,
                  child: Opacity(
                    opacity: currentOpacity,
                    child: IntrinsicHeight(
                      child: SalonCard(
                        image: images[index],
                        title: titles[index],
                      ),
                    ),
                  ),
                );
              },
            ),


          ],
        ),
      ),
    );
  }
}

class SalonCard extends StatelessWidget {
  final String image;
  final String title;

  const SalonCard({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: AspectRatio(
              aspectRatio: 2.2 / 1,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                    Image.asset(
                        googleMapIcon,
                        width: Get.width*0.08,
                        height: Get.width*0.08,
                    )
                  ],
                ),
                const SizedBox(height: 2),
                const Row(
                  children: [
                    Text(
                      'Rohini, New Delhi',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: Colors.green,
                          size: 16,
                        ),
                        Text(
                          '3.1 Km',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Text(
                  'Ambience Rating',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Row(
                      children: List.generate(4, (index) {
                        return const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        );
                      }),
                    ),
                    const Icon(
                      Icons.star_half,
                      color: Colors.amber,
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      '4.5/5',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      '482 Reviews',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const KCustomButton(
                  buttonText: "Book Appointment",
                  radius: 100,
                  verticalPadding: 10,
                  iconChild: Icon(Icons.arrow_forward_outlined, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
