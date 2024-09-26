import 'package:bookmybeauty/components/form_builder_text_form_field.dart';
import 'package:bookmybeauty/components/ktoggle_button.dart';
import 'package:bookmybeauty/constants/app_details.dart';
import 'package:bookmybeauty/shared/globle_app_bar.dart';
import 'package:flutter/material.dart';


import '../widgets/nearby_saloons_card.dart';

class NearbySaloons extends StatelessWidget {
  const NearbySaloons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const GlobalAppBar(title: Text("NearBy Saloons")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CustomTextFormField(
              name: "searchSaloon",
              labelText: "Search Saloon",
              suffixIcon: Icons.search,
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Saloons List",
                  style: TextStyle(fontSize: fontSizeHeading),
                ),
                KToggleButton(),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return  nearBySaloonCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
