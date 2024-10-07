import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/images.dart';
import '../../../shared/globle_app_bar.dart'; // Replace with your actual image import

class OurBlogsRoutes extends StatefulWidget {
  const OurBlogsRoutes({super.key});

  @override
  State<OurBlogsRoutes> createState() => _OurBlogsRoutesState();
}

class _OurBlogsRoutesState extends State<OurBlogsRoutes> {
  int? _touchedIndex;  // To track the currently touched item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      appBar: const GlobalAppBar(
        title: 'Our Blogs',
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10, // Number of items
        itemBuilder: (context, index) {
          return GestureDetector(
            onPanDown: (_) {  // Detect touch (not tap)
              setState(() {
                _touchedIndex = index;  // Set the current touched index
              });
            },
            child: Container(

              width: Get.width,
              margin: const EdgeInsets.only(left: 15, right: 15, top: 25, bottom: 9),
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: _touchedIndex == index
                      ? Color(0xFFB31217) // Change color when the item is touched
                      : const Color(0xFFFFFFFF), // Default border color
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: Image.asset(
                      demoOurBlogs,  // Replace with your image path
                      width: 136,
                      height: 136,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Low Fade Haircuts For Men Make You Look Sharp",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Expanded(
                                child: Text(
                                  "Lorem Ipsum simply dummy text for printing and or typesetting for the industry's dummy",
                                  maxLines: 3,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  print("left arrow click");
                                },
                                  child: const Icon(Icons.arrow_forward, color: Colors.red)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
