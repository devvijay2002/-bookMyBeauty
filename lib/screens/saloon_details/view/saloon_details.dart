
import 'package:bookmybeauty/constants/images.dart';
import 'package:bookmybeauty/shared/globle_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:bookmybeauty/constants/colors.dart';

import '../widgets/care_category_card.dart';

class SaloonDetails extends StatefulWidget {
  const SaloonDetails({super.key});

  @override
  SaloonDetailsState createState() => SaloonDetailsState();
}

class SaloonDetailsState extends State<SaloonDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCardColor,
      appBar: const GlobalAppBar(title: Text('Saloon Details')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 8, // Number of images in the grid
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // 4 images per row
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return Image.asset(girlImage); // Replace with your image source
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'C-56, Building Krishna Apartment,\nNear Sunrise Mall, Laxmi Nagar, Delhi-92',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text('bookmybeautydelhi@gmail.com'),
              const SizedBox(height: 5),
              const Row(
                children: [
                  Icon(Icons.access_time, color: Colors.green),
                  SizedBox(width: 5),
                  Text('Open', style: TextStyle(color: Colors.green)),
                  Text(' Closed 6 pm'),
                ],
              ),
              const SizedBox(height: 10),
              const Text('Ambience Rating', style: TextStyle(color: Colors.black54)),
              const Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star_half, color: Colors.amber),
                  SizedBox(width: 5),
                  Text('4.5/5', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 5),
                  Text('482 Reviews'),
                ],
              ),

              // Wrapped ListView in SizedBox to give height
              const SizedBox(height: 20),
              SizedBox(
                height: 120, // Adjust height according to your needs
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: CareCategoryCard(
                        category: "Hair Cut",
                        imageUrl: girlImage,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}