import 'package:flutter/material.dart';
import '../../../constants/images.dart';
import 'package:url_launcher/url_launcher.dart';

class noInternet extends StatefulWidget {
  const noInternet({super.key});

  @override
  State<noInternet> createState() => _noInternetState();
}

class _noInternetState extends State<noInternet> {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF2F2F2),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                noInternetImage,
                height: 90,
                width: 99,
              ),
              SizedBox(height: 10,),
              Text("Oops!"),
              SizedBox(height: 10,),
              const Text(
                  "There is no internet connection Please check your internet connection",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10,),
            Center(
              child: GestureDetector(
                onTap: () => _launchURL('https://www.google.com'), // Replace with your URL
                child: TextButton(
                  onPressed: () => _launchURL('https://www.google.com'), // Matching onTap with onPressed
                  child: const Text("Try Again"),
                ),
              )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
