
import 'package:bookmybeauty/constants/images.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bookmybeauty/constants/images.dart';

import '../../../constants/colors.dart';
import '../controller/home_controller.dart';

class SaloonType extends StatefulWidget {
  const SaloonType({super.key});

  @override
  State<SaloonType> createState() => _SaloonTypeState();
}

class _SaloonTypeState extends State<SaloonType> {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Men Container
          Expanded(
            child: GestureDetector(
              onTap: () {
                homeController.updateSaloonSelectedType(selectedType: 'Men');
              },
              child: Container(
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: homeController.saloonSelectedType.value == 'Men'
                        ? dimRedColor // Selected background color
                        : Colors.white, // Default background color
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: const Offset(0, 0),
                      ),
                    ]),
                child: const Image(image: AssetImage(menIcon)),
              ),
            ),
          ),
          const SizedBox(width: 20),

          // Women Container
          Expanded(
            child: GestureDetector(
              onTap: () {
                homeController.updateSaloonSelectedType(selectedType: 'Women');
              },
              child: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                    color: homeController.saloonSelectedType.value == 'Women'
                        ? dimRedColor
                        : Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: const Offset(0, 0),
                      ),
                    ]),
                child: const Image(image: AssetImage(womenIcon)),
              ),
            ),
          ),
          const SizedBox(width: 20),

          // Unisex Container
          Expanded(
            child: GestureDetector(
              onTap: () {
                homeController.updateSaloonSelectedType(selectedType: 'Unisex');
              },
              child: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                    color: homeController.saloonSelectedType.value == 'Unisex'
                        ? dimRedColor
                        : Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: const Offset(0, 0),
                      ),
                    ]),
                child: const Image(image: AssetImage(unisexIcon)),
              ),
            ),
          ),
        ],
      );
    });
  }
}
