import 'package:bookmybeauty/constants/images.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: Get.height*0.15,
                    width: Get.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(saloonImage),
                      ),
                    ),
                  ),


                ],
              ),

              DrawerItems(
                'Profile',
                imageUrl: "assets/icons/tile_first_icon.png",
                    () {
                  Navigator.pop(context);

                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>GetCurrentLocation()));
                },
              ),
              DrawerItems(
                'Appointments',
                imageUrl: "assets/icons/tile_second_icon.png",
                    () {
                  Navigator.pop(context);

                },
              ),
              DrawerItems(
                'Blog',
                imageUrl: "assets/icons/tile_second_icon.png",
                    () {
                  Navigator.pop(context);

                },
              ),
              DrawerItems(
                'Contact Us',
                imageUrl: "assets/icons/tile_third_icon.png",
                    () {
                  Navigator.pop(context);

                },
              ),
              DrawerItems(
                'Latest Videos',
                imageUrl: "assets/icons/tile_fourth_icon.png",
                    () {
                  Navigator.pop(context);

                },
              ),
              DrawerItems(
                'Settings',
                imageUrl: "assets/icons/tile_fourth_icon.png",
                    () {
                  Navigator.pop(context);

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class DrawerItems extends StatelessWidget {
  final String imageUrl;
  final String title;
  final void Function()? onTap;

  const DrawerItems(this.title, this.onTap,
      {super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    //ToDO
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 0.0, 0),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          children: [
            InkWell(
              splashColor: Colors.orangeAccent,
              onTap: onTap,
              child: SizedBox(
                  height: 65,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                              height: 27,
                              width: 27,
                              child: Image.asset(imageUrl)),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                          ),
                          Text(
                            title,
                            style: const TextStyle(
                                fontSize: 13, color: Colors.black54),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 18.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                        ),
                      )
                    ],
                  )),
            ),
            const DottedLine(
              direction: Axis.horizontal,
              lineLength: double.infinity,
              lineThickness: 1.0,
              dashLength: 2.0,
              dashColor: Colors.grey,
              dashRadius: 0.0,
              dashGapLength: 2.0,
              dashGapColor: Colors.transparent,
              dashGapRadius: 0.0,
            )
          ],
        ),
      ),
    );
  }
}
