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
        prefixIcon: Icon(prefixIcon, color: Colors.red),
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
