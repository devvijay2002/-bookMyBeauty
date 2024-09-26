import 'package:bookmybeauty/components/kcustom_button.dart';
import 'package:bookmybeauty/constants/app_details.dart';
import 'package:bookmybeauty/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../components/kwidgets.dart';
import '../../../shared/globle_app_bar.dart';


class ServiceDetails extends StatelessWidget {
  const ServiceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(title: Text("Service Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: const BorderRadius.all(Radius.circular(9)),
                child:     Image.network(
                  'https://i.pinimg.com/564x/85/de/49/85de492bbb0da1b12010eacae294a6c5.jpg', // Replace with your image URL
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Gold Facial',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.timer, color: dimBlackColor),
                      SizedBox(width: 4),
                      Text(
                        '2 Hrs. 30 Min.',
                        style: TextStyle(color: dimBlackColor),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                'Loreal',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20,),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTitleSection("Included Services"),
                      buildBulletPoints([
                        "Making your hair frizz free",
                        "Create that sizzling style",
                        "Excludes hair wash",
                        "Hair Styling done by our male experts",
                      ]),

                    ],
                  ),
                ),
              ),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      buildTitleSection("What's Included"),
                      buildBulletPoints([
                        "Includes blow dry hair styling",
                        "Helps in hair growth",
                      ]),
                    ]
                  ),
                ),
              ),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      buildTitleSection("Brands & Equipment Uses"),
                      buildBulletPoints([
                        "Blow dryer",
                        "Combs & brushes",
                        "Spray bottle",
                        "Disinfectant",
                        "Face shield",
                        "Section clips",
                        "Mirror",
                        "Hair brushes",
                      ]),
                      const SizedBox(height: 30),
                      const Center(
                          child: KCustomButton(
                              buttonText: "next",
                            textStyle: TextStyle(fontSize: fontSizeHeading,color: Colors.white),
                            radius: 100,
                            iconChild: Icon(Icons.arrow_forward,color: Colors.white,),
                          ),
                      ),
                    ]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

