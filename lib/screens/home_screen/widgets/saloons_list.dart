import 'package:bookmybeauty/components/kcustom_button.dart';
import 'package:bookmybeauty/components/ktext_form_field.dart';
import 'package:bookmybeauty/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';

class DynamicSizeCarousel extends StatefulWidget {
  final List<String> images;
  final List<String> titles;

  const DynamicSizeCarousel({
    super.key,
    required this.images,
    required this.titles,
  });

  @override
  DynamicSizeCarouselState createState() => DynamicSizeCarouselState();
}
class DynamicSizeCarouselState extends State<DynamicSizeCarousel> {
  final PageController _pageController = PageController(viewportFraction: 0.7);
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
    return Container(
      color: dimRedColor,
      child: Column(
        children: [
          // Search bar and other UI components
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

          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.images.length,
              itemBuilder: (context, index) {
                final double scale = (_currentPage - index).abs().clamp(0.0, 1.0);
                final double currentScale = 1 - (scale * 0.1);
                final double currentOpacity = 1 - (scale * 0.5);

                return Transform.scale(
                  scale: currentScale,
                  child: Opacity(
                    opacity: currentOpacity,
                    child: IntrinsicHeight(
                      child: Expanded(
                        child: SalonCard(
                          image: widget.images[index],
                          title: widget.titles[index],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 30),
        ],
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
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Image section
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: AspectRatio(
              aspectRatio: 2 / 1,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
            ),
          ),
          // Text and details section
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 5),
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
                const SizedBox(height: 10),
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
                  radius: 70,
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

