import 'package:bookmybeauty/components/form_builder_text_form_field.dart';
import 'package:bookmybeauty/components/ktext_form_field.dart';
import 'package:bookmybeauty/constants/colors.dart';
import 'package:bookmybeauty/shared/globle_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../home_screen/widgets/saloons_list.dart';
import '../widgets/services_list_widget.dart';

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
                  return   const ServiceCard();
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