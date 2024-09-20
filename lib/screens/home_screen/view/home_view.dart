import 'package:bookmybeauty/constants/colors.dart';
import 'package:bookmybeauty/constants/images.dart';
import 'package:bookmybeauty/shared/globle_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/ktoggle_button.dart';
import '../widgets/saloon_type.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GlobalAppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            SizedBox(
                height: Get.height*0.09,
                width: Get.width*0.09,
                child: const Image(image: AssetImage(appLogo))),
            const SizedBox(width: 10,),
            const Text(
              "BookMyBeauty",
              style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.line_weight_outlined,color: dimBlackColor,size: 30,)),
          actions: [
          IconButton(onPressed: () {
          },
              icon: const Icon(Icons.search,size: 30,color: dimBlackColor)),
          Container(
            padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                color: Colors.white,
                border: Border.all(
                  color: dimBlackColor,
                  width: 2.0,
                ),
              ),
              child:const ClipOval(
                  child:Icon(Icons.person,size: 20,color: dimBlackColor))
          ),
          IconButton(onPressed: () {
          },
              icon: const Icon(Icons.shopping_cart,size: 30,color: dimBlackColor,)),
          const SizedBox(width: 10,)
        ],

      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
          child: Column(
            crossAxisAlignment:  CrossAxisAlignment.start,
            children: [
             Container(
               decoration:  const BoxDecoration(
                 gradient: kPrimaryGradient,
                 borderRadius: BorderRadius.all(Radius.circular(10))
               ),
               height: Get.height*0.16,
             ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                children: [
                  Text("Looking For",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  KToggleButton()
                ],
              ),
              const SizedBox(height: 20),
              const Text("Saloon & Partner type",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              const SizedBox(height: 20),
              const SaloonType()
            ],
          ),
        ),
      )
    );
  }
}
