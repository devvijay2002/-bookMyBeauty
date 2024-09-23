import 'package:flutter/material.dart';

class TrendingServiceWidget extends StatelessWidget {
  final List<String> serviceImages;
  final List<String>? serviceTitles;

  const TrendingServiceWidget({
    super.key,
    required this.serviceImages,
   this.serviceTitles,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Trending Services', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextButton(
                onPressed: () {
                  // Implement navigation to all services
                },
                child: const Text('View All', style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width / 3.2,  // Set height dynamically based on the screen width
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: serviceImages.length,
            itemBuilder: (context, index) {
              return AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  margin: const EdgeInsets.only(right: 12,bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(serviceImages[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                  child: serviceTitles !=null ?
                  Text(
                    serviceTitles![index],
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, backgroundColor: Colors.black54),
                  ): const SizedBox()
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
