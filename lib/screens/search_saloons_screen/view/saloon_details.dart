import 'package:bookmybeauty/shared/globle_app_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/image_grid_widget.dart';

import 'package:bookmybeauty/components/form_builder_text_form_field.dart';
import 'package:bookmybeauty/components/ktext_form_field.dart';
import 'package:bookmybeauty/constants/colors.dart';
import 'package:bookmybeauty/shared/globle_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../home_screen/widgets/saloons_list.dart';
import '../widgets/services_list_widget.dart';

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
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: ImageGrid()
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'C-56, Building Krishna Apartment,\nNear Sunrise Mall, Laxmi Nagar, Delhi-92',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text('bookmybeautydelhi@gmail.com'),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.green),
                    SizedBox(width: 5),
                    Text('Open', style: TextStyle(color: Colors.green)),
                    Text(' Closed 6 pm'),
                  ],
                ),
                SizedBox(height: 10),
                Text('Ambience Rating', style: TextStyle(color: Colors.black54)),
                Row(
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
              ],
            ),
          ],
        )
         
    )
 );

  }
}

