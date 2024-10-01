import 'package:bookmybeauty/shared/globle_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/images.dart';

class blogDetailsRoute extends StatefulWidget {
  const blogDetailsRoute({super.key});

  @override
  State<blogDetailsRoute> createState() => _blogDetailsRouteState();
}

class _blogDetailsRouteState extends State<blogDetailsRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: "Blogs Details",
      centerTitle: true,),
      backgroundColor: Color(0xFFF2F2F2),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(right: 15,left: 15,top: 8,bottom: 8),
          child: Column(
            children: [
              SizedBox(height: 25,),
              Image.asset(blogImage),
              SizedBox(height: 9,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 7,
                    child: Text("Do's and Don'ts after a Medi Facial | Rasaderm",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {

                          print("share button pressed");
                        },
                        child: SvgPicture.asset(shareIconSvg,
                        height: 20,
                        width: 20,),
                      ),
                      SizedBox(width: 3,),
                      GestureDetector(
                        onTap: () async {
                          const url = 'https://www.facebook.com/';
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url));
                          } else {
                            print('Could not launch $url');
                          }
                          print("share button pressed");
                        },
                        child: SvgPicture.asset(facebookIconSvg,
                        height: 20,
                        width: 20,),
                      ),
                      SizedBox(width: 3,),
                      GestureDetector(
                        onTap: () async {
                          const url = "https://x.com/?lang=en-in";
                          if (await canLaunchUrl(Uri.parse(url))){
                            await launchUrl(Uri.parse(url));
                          } else {
                            print("could not lounch $url");
                          }
                          print("twitter icon pressed");
                        },
                        child: Image.asset(twitterIcon,
                        height: 20,
                        width: 20,),
                      ),
                      SizedBox(width: 3,),
                      GestureDetector(
                        onTap: () async {
                          const url ="https://www.linkedin.com/";
                          if (await canLaunchUrl(Uri.parse(url))){
                            await launchUrl(Uri.parse(url));
                          } else {
                            print("could not louch $url");
                          }
                          print("linkedin icon pressed");
                        },
                        child: SvgPicture.asset(linkedinIconSvg,
                        height: 20,
                        width: 20,),
                      ),
                      SizedBox(width: 3,),
                      GestureDetector(
                        onTap: () async {
                          const whatsappUrl = "whatsapp://send?text=Hello%20World";
                          // Checking if WhatsApp is installed on the device
                          if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
                            await launchUrl(Uri.parse(whatsappUrl));
                          } else {
                            print("Could not launch WhatsApp. Please ensure it's installed on your device.");
                            // You can show an error message to the user
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("WhatsApp is not installed")),
                            );
                          }
                          print("whatsup Icon pressed");
                        },
                        child: SvgPicture.asset(whatsupIconSvg,
                        height: 20,
                        width: 20,),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              const Text("Lorem Ipsum simply dummy text for printing and content typesetting for the industry's dummy"),
              const SizedBox(height: 15,),
              const Text("Lorem Ipsum is simply dummy text for the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, the when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
              Container(
                margin: EdgeInsets.only(top:20 ),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text("Lorem Ipsum is simply dummy text for printing and typesetting industry. Lorem Ipsum has been industry's standard dummy text ever since"),
        
              ),
              SizedBox(height: 21,),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFFF3D6D7),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Text("Lorem Ipsum is simply dummy text for printing and typesetting industry. Lorem Ipsum has been industry's standard dummy text ever since"),
              ),
              SizedBox(height: 15,),
              Text("It was popularised in the 1960s with the release of Letraset sheets containing is Lorem Ipsum for passages, and more recently with desktop for publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
            ],
          ),
        ),
      ),
    );
  }
}

