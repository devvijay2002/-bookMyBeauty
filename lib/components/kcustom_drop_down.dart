import 'package:bookmybeauty/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';


class CustomFormDropdown extends StatelessWidget {
  final String name;
  final List<String> items;
  final String? initialValue;
  final String hintText;
  final IconData prefixIcon;
  final Color borderColor;
  final double borderWidth;

  const CustomFormDropdown({
    super.key,
    required this.name,
    required this.items,
    this.initialValue,
    this.hintText = 'Select an option',
    this.prefixIcon = Icons.male,
    this.borderColor = dimBlackColor,
    this.borderWidth = 1,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      name: name,

      validator: FormBuilderValidators.required(),
      initialValue: initialValue,
      builder: (FormFieldState<String?> field) {
        // Map gender to corresponding icons
        IconData currentIcon;
        switch (field.value) {
          case 'Male':
            currentIcon = Icons.male;
            break;
          case 'Female':
            currentIcon = Icons.female;
            break;
          case 'Other':
            currentIcon = Icons.person;
            break;
          default:
            currentIcon = prefixIcon; // Default icon
        }

        return CustomDropdown(
          value: field.value,
          items: items,
          onChanged: (value) {
            field.didChange(value); // Update field value
          },
          hintText: hintText,
          prefixIcon: currentIcon, // Dynamic icon based on selection
          borderColor: borderColor,
          borderWidth: borderWidth,
        );
      },
    );
  }
}
class CustomDropdown extends StatelessWidget {
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String hintText;
  final IconData prefixIcon;
  final Color borderColor;
  final double borderWidth;

  const CustomDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hintText = 'Select an option',
    this.prefixIcon = Icons.male,
    this.borderColor = dimBlackColor,
    this.borderWidth = 0.1,
  });

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(prefixIcon, color: kPrimaryColor),
        contentPadding: const EdgeInsets.symmetric(vertical: -10, horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: value,
          borderRadius: BorderRadius.circular(10),
          dropdownColor: Colors.white,
          hint: Text(hintText),
          items: items
              .map((option) => DropdownMenuItem<String>(
            value: option,
            child: Text(option),
          ))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
/*
class CustomFormDropdown extends StatelessWidget {
  final String name;
  final List<String> items;
  final String? initialValue;
  final String hintText;
  final IconData prefixIcon;
  final Color borderColor;
  final double borderWidth;

  const CustomFormDropdown({super.key,
    required this.name,
    required this.items,
    this.initialValue,
    this.hintText = 'Select an option',
    this.prefixIcon = Icons.male,
    this.borderColor = Colors.black,
    this.borderWidth = 1.5,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      name: name,
      validator: FormBuilderValidators.required(),
      initialValue: initialValue,
      builder: (FormFieldState<String?> field) {
        return CustomDropdown(
          value: field.value,
          items: items,
          onChanged: (value) {
            field.didChange(value);
          },
          hintText: hintText,
          prefixIcon: prefixIcon,
          borderColor: borderColor,
          borderWidth: borderWidth,
        );
      },
    );
  }
}



class CustomDropdown extends StatelessWidget {
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String hintText;
  final IconData prefixIcon;
  final Color borderColor;
  final double borderWidth;

  const CustomDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hintText = 'Select an option',
    this.prefixIcon = Icons.male,
    this.borderColor = Colors.black,
    this.borderWidth = 1.5,
  });

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(prefixIcon, color: kPrimaryColor),
        contentPadding: const EdgeInsets.symmetric(vertical: -10, horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: value,
          hint: Text(hintText),
          items: items
              .map((option) => DropdownMenuItem<String>(
            value: option,
            child: Text(option),
          ))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
*/
