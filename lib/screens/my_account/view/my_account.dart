import 'dart:io';
import 'package:bookmybeauty/screens/my_account/controller/my_account_controller.dart';
import 'package:bookmybeauty/shared/globle_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/kwidgets.dart';
import '../../../constants/colors.dart';
import '../../../shared/custom_popups/main_class/custom_popups.dart';

class MyAccountView extends StatefulWidget {
  const MyAccountView({super.key});

  @override
  State<MyAccountView> createState() => _MyAccountViewState();
}

class _MyAccountViewState extends State<MyAccountView> {
  var myAccountController = Get.find<MyAccountController>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:const GlobalAppBar(title: Text("My Account")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                buildTitleSection("80 % Complete"),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: 0.8, // 80% completed
                        minHeight: 25,
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        backgroundColor: Colors.grey[300],
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(width: 8),

                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => CustomPopups.showImagePickerPopup(context: context),
                      child: Stack(
                        children: [
                          Container(
                            height:Get.height*0.07,
                            width:Get.height*0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Colors.white,
                              border: Border.all(
                                color: dimBlackColor,
                                width: 2.0,
                              ),
                            ),
                            child:ClipOval(
                                child:Obx(() {
                                  if (myAccountController.croppedImagePath.isNotEmpty) {
                                    return Image.file(File(myAccountController.croppedImagePath.value));
                                  } else {
                                    return const Icon(Icons.person,size: 40,color: dimBlackColor,);
                                  }
                                })

                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                  height :30,
                                  width :30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100.0),
                                      color: Colors.white,
                                      border: Border.all(
                                        color: dimBlackColor,
                                        width: 1.0,
                                      )
                                  ),
                                  child: const Center(child: Icon(Icons.camera_alt,color: Colors.black,size: 17,)))
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Deepak Singh',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Icon(Icons.edit,size: 16,),
                          ],
                        ),
                        Text('91-9599043602'),
                      ],
                    ),
                  ],
                )
                ,
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              padding: const EdgeInsets.all(16.0),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                buildGridTile(Icons.calendar_today, 'Appointment'),
                buildGridTile(Icons.location_on, 'Address'),
                buildGridTile(Icons.support_agent, 'Help & Support'),
                buildGridTile(Icons.shopping_cart, 'My Cart'),
                buildGridTile(Icons.lock, 'Change Password'),
                buildGridTile(Icons.info, 'About Us'),
                buildGridTile(Icons.article, 'Blog'),
                buildGridTile(Icons.share, 'Share With Family & Friends'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGridTile(IconData icon, String title) {
    return GestureDetector(
      onTap: () {
        // Handle tile click
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 6,
                  offset: Offset(0, 0)
              )
            ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.red,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}



