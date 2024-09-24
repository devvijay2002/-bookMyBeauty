
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/colors.dart';

class SaloonsListWidget extends StatelessWidget {
  const SaloonsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
          color: kCardColor,
          boxShadow: const [
            BoxShadow(
                color: dimGreyColor,
                blurRadius: 0.8,
                spreadRadius: 0.8
            )
          ],
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://i.pinimg.com/564x/e7/18/69/e71869ea3ee092932da5e6e013bf7f67.jpg', // Replace with your image URL
              height: Get.height*0.15,
              width: Get.width*0.29,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 10),
          // Salon Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Salon Name
                const Text(
                  'Book My Beauty Salon',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                // Location and Distance
                const Text(
                  'Laxmi Nagar, Delhi... 3Km.',
                  style: TextStyle(
                    color: dimBlackColor,
                  ),
                ),
                SizedBox(height: 5),
                // Ambience Rating
                const Row(
                  children: [
                    Text(
                      'Ambience Rating',
                      style: TextStyle(
                        fontSize: 12,
                        color: dimBlackColor,
                      ),
                    ),
                    SizedBox(width: 5),
                    // Rating stars
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 16),
                        Icon(Icons.star, color: Colors.orange, size: 16),
                        Icon(Icons.star, color: Colors.orange, size: 16),
                        Icon(Icons.star, color: Colors.orange, size: 16),
                        Icon(Icons.star_half, color: Colors.orange, size: 16),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5),
                // View Detail Button
                GestureDetector(
                  onTap: () {
                    // Navigate to details
                  },
                  child: const Text(
                    'View Detail',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
