import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tutorial_app/product/widgets/text_field/custom_text_field.dart';

import 'src/register_view_mixin.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> with RegisterViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 16.0),
              CustomTextField(
                name: 'Email',
                controller: emailController,
                label: 'Email',
                validators: [
                  FormBuilderValidators.required(
                      errorText: 'Email is required'),
                  FormBuilderValidators.email(errorText: 'Invalid email'),
                ],
              ),
              const SizedBox(height: 16.0),
              CustomTextField(
                name: 'Password',
                controller: passwordController,
                label: 'Password',
                validators: [
                  FormBuilderValidators.required(
                      errorText: 'Password is required'),
                  FormBuilderValidators.minLength(6,
                      errorText: 'Password must be at least 6 characters'),
                ],
              ),
              const SizedBox(height: 16.0),
              CustomTextField(
                name: 'Confirm Password',
                controller: confirmPasswordController,
                label: 'Confirm Password',
                validators: [
                  FormBuilderValidators.required(
                      errorText: 'Confirm Password is required'),
                  FormBuilderValidators.minLength(6,
                      errorText: 'Password must be at least 6 characters'),
                  FormBuilderValidators.equal(
                    passwordController.text,
                    errorText: 'Password does not match',
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  formKey.currentState?.save();
                  if (formKey.currentState?.validate() ?? false) {
                    print('Register');
                  }
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
