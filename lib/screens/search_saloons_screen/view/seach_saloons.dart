import 'package:bookmybeauty/components/form_builder_text_form_field.dart';
import 'package:bookmybeauty/components/ktext_form_field.dart';
import 'package:bookmybeauty/constants/colors.dart';
import 'package:bookmybeauty/shared/globle_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SearchSaloons extends StatefulWidget {
  const SearchSaloons({super.key});

  @override
  SearchSaloonsState createState() => SearchSaloonsState();
}

class SearchSaloonsState extends State<SearchSaloons> {
  List<bool> isSelected = [true, false];
  final _formKey = GlobalKey<FormBuilderState>();
  final List<Salon> salons = [
    Salon("Book My Beauty Salon", "Laxmi Nagar, Delhi.", "3Km", 4),
    Salon("Book My Beauty Salon", "Laxmi Nagar, Delhi.", "200m", 5),
    Salon("Book My Beauty Salon", "Laxmi Nagar, Delhi.", "4Km", 3),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(title: Text('Search Saloons/Services')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderRadioGroup<String>(
                name: 'radioButton',
                activeColor: kPrimaryColor,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                initialValue: "1",
                options:  const [
                  FormBuilderFieldOption(value: "1", child: Text('Search by Salon')),
                  FormBuilderFieldOption(value: '2', child: Text('Search by Services')),
                ],
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomTextFormField(name: "searchData", labelText: "Search",suffixIcon: Icons.search),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                  return   Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    decoration: BoxDecoration(
                        color: kCardColor,
                        boxShadow: const [
                          BoxShadow(
                              color: dimGreyColor,
                              blurRadius: 0.8,
                              spreadRadius: 0.8
                          )
                        ],
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://i.pinimg.com/564x/e7/18/69/e71869ea3ee092932da5e6e013bf7f67.jpg', // Replace with your image URL
                            height: 80,
                            width: 80,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Salon Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Salon Name
                              const Text(
                                'Book My Beauty Salon',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              // Location and Distance
                              const Text(
                                'Laxmi Nagar, Delhi... 3Km.',
                                style: TextStyle(
                                  color: dimBlackColor,
                                ),
                              ),
                              SizedBox(height: 5),
                              // Ambience Rating
                              const Row(
                                children: [
                                  Text(
                                    'Ambience Rating',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: dimBlackColor,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  // Rating stars
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.orange, size: 16),
                                      Icon(Icons.star, color: Colors.orange, size: 16),
                                      Icon(Icons.star, color: Colors.orange, size: 16),
                                      Icon(Icons.star, color: Colors.orange, size: 16),
                                      Icon(Icons.star_half, color: Colors.orange, size: 16),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              // View Detail Button
                              GestureDetector(
                                onTap: () {
                                  // Navigate to details
                                },
                                child: Text(
                                  'View Detail',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },),
              ),


            ],
          ),
        ),
      ),
    );
  }
}

class Salon {
  final String name;
  final String location;
  final String distance;
  final int rating;

  Salon(this.name, this.location, this.distance, this.rating);
}