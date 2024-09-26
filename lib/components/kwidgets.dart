import 'package:bookmybeauty/constants/app_details.dart';
import 'package:flutter/cupertino.dart';

Widget buildTitleSection(String title) {
  return Text(
    title,
    style: const TextStyle(
      fontSize: fontSizeTitle,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget buildBulletPoints(List<String> points) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: points.map((point) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("• ", style: TextStyle(fontSize: 18)),
            Expanded(
              child: Text(
                point,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      );
    }).toList(),
  );
}

