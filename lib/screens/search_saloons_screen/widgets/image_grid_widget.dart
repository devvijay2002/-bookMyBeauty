import 'package:bookmybeauty/constants/images.dart';
import 'package:flutter/cupertino.dart';

class ImageGrid extends StatelessWidget {
  final List<String> imageList = List.generate(
    8,(index) => girlImage, // Make sure the image assets are named properly.
  );

  ImageGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Adjust the number of columns based on your design.
        crossAxisSpacing: 10, // Spacing between images horizontally.
        mainAxisSpacing: 10, // Spacing between images vertically.
      ),
      itemCount: imageList.length,
      itemBuilder: (context, index) {
        return Image.asset(
          imageList[index],
          fit: BoxFit.cover, // This ensures the images cover the grid cells.
        );
      },
    );
  }
}