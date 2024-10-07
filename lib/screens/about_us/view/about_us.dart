import 'package:bookmybeauty/app.dart';
import 'package:bookmybeauty/shared/globle_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/images.dart';

class aboutUsRoute extends StatefulWidget {
  const aboutUsRoute({super.key});

  @override
  State<aboutUsRoute> createState() => _aboutUsRouteState();
}

class _aboutUsRouteState extends State<aboutUsRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(
        title: "About Us",
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Text("Book My Beauty",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFB31217)
                    ),
                    ),
                    SizedBox(
                      width: 200  ,
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                    Text ("Our Team",
                        style: TextStyle(
                          fontSize:18,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                    SizedBox(
                      width: 200,
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                    Text("Vision, Mission, Value",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              const Text(
                  "Book My Beauty",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
              ),
              const SizedBox(height: 10,),
              const Text("Lorem Ipsum is simply dummy text for the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, the when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially standard unchanged. \n \nIt was popularised in the 1960s with the release of Letraset sheets containing is Lorem Ipsum for passages, and more recently with desktop for publishing software like Aldus PageMaker including versions of Lorem Ipsum.",),
              const SizedBox(height: 28,),
              const Text("Our Team",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
              ),
              const SizedBox(height: 12,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("assets/icons/app_logo_png.png",
                          height: 132,
                          width: 126,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 7,),
                        const Text("Deepika Singh",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),),
                        const SizedBox(height: 3,),
                        const Text("Beautician"),
                      ],
                    ),
                    const SizedBox(width: 12,),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("assets/icons/app_logo_png.png",
                            height: 132,
                            width: 126,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 7,),
                        const Text("Renuka Bajaj",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),),
                        const SizedBox(height: 3,),
                        const Text("Beautician"),
                      ],
                    ),
                    const SizedBox(width: 12,),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("assets/icons/app_logo_png.png",
                            height: 132,
                            width: 126,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 7,),
                        const Text("Renuka Bajaj",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),),
                        const SizedBox(height: 3,),
                        const Text("Beautician"),
                      ],
                    ),
                    const SizedBox(width: 12,),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("assets/icons/app_logo_png.png",
                            height: 132,
                            width: 126,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 7,),
                        const Text("Charu Rana",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),),
                        const SizedBox(height: 3,),
                        const Text("Beautician"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28,),
              const Text("BooK My Beauty",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),),
              const SizedBox(height: 12,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xFFB31217),
                    width: 1
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(rocketIcon,
                    height: 63,
                    width: 63,),
                    const Text("Mission",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 4,),
                    Text("Lorem Ipsum is simply dummy text for the printing and or typesetting for the industry's standard for in dummy Lorem Ipsum has been industry's standard specimen typesetting for the industry's content book.")
                  ],
                ),
              ),
              const SizedBox(height: 12,),
              Container(
                width: Get.width,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Color(0xFFB31217),
                        width: 2
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(lightIcon,
                      height: 63,
                      width: 63,),
                    const Text("Vision",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),),
                    SizedBox(height: 4,),
                    Text("Lorem Ipsum is simply dummy text for the printing and or typesetting for the industry's standard for in dummy Lorem Ipsum has been industry's standard specimen typesetting for the industry's content book.")
                  ],
                ),
              ),
              const SizedBox(height: 12,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Color(0xFFB31217),
                        width: 2
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(diamondIcon,
                      height: 63,
                      width: 63,),
                    const Text("Value",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),),
                    SizedBox(height: 4,),
                    Text("Lorem Ipsum is simply dummy text for the printing and or typesetting for the industry's standard for in dummy Lorem Ipsum has been industry's standard specimen typesetting for the industry's content book.")
                  ],
                ),
              ),
              const SizedBox(height: 28)
            ],
          ),
        ),
      ),
    );
  }
}
