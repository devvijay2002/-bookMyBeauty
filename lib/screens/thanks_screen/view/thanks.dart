import 'package:bookmybeauty/components/kcustom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/images.dart';
import 'package:google_fonts/google_fonts.dart';
class ThanksView extends StatefulWidget {
  const ThanksView({super.key});

  @override
  State<ThanksView> createState() => _ThanksViewState();
}

class _ThanksViewState extends State<ThanksView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
        width: double.infinity,  // Make the image stretch to the width of the screen
        height: double.infinity, // Make the image stretch to the height of the screen
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(thanksBg),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.5),  // 90% transparent
              BlendMode.dstATop,  // Blend mode to apply transparency
            ),// Fit the image to cover the entire screen
          ),
               ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              thanksYouImage, // Replace with your image path
              width: 100, // Set the desired width
              height: 100, // Set the desired height
            ),
            const Text(
              "Thank You!",
              style: TextStyle(
                fontSize: 50, // Set the desired font size
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
               // Optional: to make the text bold
              ),
            ),
            const SizedBox(height: 10,),
            const Text(
              "Appointment Booked Succesfully",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25, // Set the desired font size
                fontWeight: FontWeight.bold, // Optional: to make the text bold
              ),
            ),
            const SizedBox(height: 10,),
            const Text(
              "Your appointment is almost confirmed. You will get beautician detail soon.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20, // Set the desired font size
                fontWeight: FontWeight.bold, // Optional: to make the text bold
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(10), // Add padding inside the box
              margin: EdgeInsets.all(10), // Add margin outside the box
              decoration: BoxDecoration(
                color: Colors.white, // Background color of the box
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Slot Timing :", // Your text
                      style: TextStyle(
                             fontSize: 15, // Text size
                             color: Colors.black, // Text color
                      ),
                      // Center the text
                                     ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                        Text(
                    "17 August 2024", // Your text
                    style: TextStyle(
                         fontSize: 15, // Text size
                         color: Colors.black, // Text color
                    ),
                   textAlign: TextAlign.center, // Center the text
                 ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.access_time, // Clock icon
                          color: Colors.black, // Icon color
                          size: 15, // Icon size
                        ),
                        SizedBox(width: 5),
                        Text(
                        "Morning 11:30 AM", // Your text
                        style: TextStyle(
                          fontSize: 15, // Text size
                          color: Colors.black, // Text color
                        ),
                        textAlign: TextAlign.center, // Center the text
                      ),
                      ]
                  ),
                  Center(
                    child: Text(
                      "Appointment Id - 105", // Your text
                      style: TextStyle(
                        fontSize: 15, // Text size
                        color: Colors.black, // Text color
                      ),
                      // Center the text
                    ),
                  ),
                ]
              ),
            ),
            const SizedBox(height: 10,),
            const KCustomButton(
              buttonText: "Back to Home",
              iconChild: Icon(Icons.arrow_forward,color: Colors.white,),
            ),
          ],
        ),
      ),
    );
  }
}
