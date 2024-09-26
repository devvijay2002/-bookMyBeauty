import 'package:bookmybeauty/components/kcustom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: kCardColor,
          boxShadow: const [
            BoxShadow(color: dimGreyColor, blurRadius: 0.8, spreadRadius: 0.8)
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Image with rounded corners
              Container(
                clipBehavior: Clip.antiAlias,
                height: Get.height * 0.12,
                width: Get.width * 0.29,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.network(
                  'https://i.pinimg.com/564x/e7/18/69/e71869ea3ee092932da5e6e013bf7f67.jpg', // Replace with your image URL
                  fit: BoxFit.fitHeight,
                ),
              ),
              // Positioned Button (10 pixels below the image)
              const Positioned(
                bottom: 0, // Adjust this value to properly position the button below the image
                child: KCustomButton(
                  buttonText: "Add to Cart",
                  verticalPadding: 4,
                  horizontalPadding: 7,
                  isOutline: true,
                  textStyle: TextStyle(fontSize: 14, color: kPrimaryColor),
                  radius: 5,
                  iconChild: Icon(Icons.arrow_forward,size: 14,color: kPrimaryColor,),
                                 // Ensure button background color is red
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          // Service Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Service Name
                const Text(
                  'Wax',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                // Brand Name
                const Text(
                  'Loreal',
                  style: TextStyle(
                    color: dimBlackColor,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 5),
                // Duration and Time Icon
                const Row(
                  children: [
                    Icon(Icons.access_time, size: 14, color: Colors.grey),
                    SizedBox(width: 5),
                    Text(
                      '2 Hrs. 30 Min.',
                      style: TextStyle(
                        fontSize: 12,
                        color: dimBlackColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                // Pricing
                const Row(
                  children: [
                    // New Price
                    Text(
                      '₹499',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(width: 10),
                    // Old Price with Strike-through
                    Text(
                      '₹1000',
                      style: TextStyle(
                        fontSize: 14,
                        color: dimBlackColor,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(width: 10),
                    // Discount Percentage
                    Text(
                      '50% off',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                // View Detail
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
