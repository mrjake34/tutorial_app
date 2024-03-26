import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'package:tutorial_app/feature/auth/register/model/register_request_model.dart';
import 'package:tutorial_app/feature/auth/register/view_model/register_view_model.dart';
import 'package:tutorial_app/product/widgets/text_field/custom_text_field.dart';

part 'src/register_view_mixin.dart';
part 'src/_button_field.dart';
part 'src/_confirm_password_field.dart';
part 'src/_email_field.dart';
part 'src/_error_field.dart';
part 'src/_password_field.dart';
part 'src/_full_name_field.dart';
part 'src/_phone_field.dart';

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
      body: ChangeNotifierProvider(
        create: (context) => registerViewModel,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilder(
              key: formKey,
              child: Column(
                children: [
                  const FlutterLogo(size: 150, style: FlutterLogoStyle.stacked),
                  const SizedBox(height: 16.0),
                  _FullNameField(emailController: fullNameController),
                  const SizedBox(height: 16.0),
                  _PhoneField(emailController: phoneController),
                  const SizedBox(height: 16.0),
                  _EmailField(emailController: emailController),
                  const SizedBox(height: 16.0),
                  _PasswordField(passwordController: passwordController),
                  const SizedBox(height: 16.0),
                  _ConfirmPasswordField(
                    confirmPasswordController: confirmPasswordController,
                    passwordController: passwordController,
                  ),
                  const _ErrorField(),
                  const SizedBox(height: 16.0),
                  _ButtonField(
                    formKey: formKey,
                    registerRequestModel: RegisterRequestModel(
                      email: emailController.text.trim(),
                      fullName: fullNameController.text.trim(),
                      phoneNumber: phoneController.text.trim(),
                      password: passwordController.text.trim(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
