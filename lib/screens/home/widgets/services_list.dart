import 'package:flutter/material.dart';

class ServiceListWidget extends StatelessWidget {
  final List<String> serviceImages;
  final List<String>? serviceTitles;

  const ServiceListWidget({
    super.key,
    required this.serviceImages,
    this.serviceTitles,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('What are you looking for?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
          height: MediaQuery.of(context).size.width / 3 + 50, // Height adjusted to include text below images
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: serviceImages.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3.2,  // Dynamically set width
                    child: AspectRatio(
                      aspectRatio: 1 / 1,  // Maintain square aspect ratio
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 8,right: 13), // Margin below image for spacing
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(serviceImages[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3.5,
                    child: Text(
                      serviceTitles?[index] ?? 'Service',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ),
                ],
              );

            },
          ),
        ),
      ],
    );
  }
}
