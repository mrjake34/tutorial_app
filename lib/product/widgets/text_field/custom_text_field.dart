import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

final class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.name,
    required this.label,
    this.obscureText = false,
    required this.validators,
    super.key,
  });
  final TextEditingController controller;
  final String name;
  final String label;
  final bool obscureText;
  final List<String? Function(String?)> validators;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      controller: controller,
      obscureText: obscureText,
      decoration:
          InputDecoration(labelText: label, border: const OutlineInputBorder()),
      validator: FormBuilderValidators.compose(validators),
    );
  }
}
