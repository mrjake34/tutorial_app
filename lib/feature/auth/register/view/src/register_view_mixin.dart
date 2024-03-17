import 'package:flutter/material.dart';
import 'package:tutorial_app/feature/auth/register/view_model/register_view_model.dart';

import '../register_view.dart';

mixin RegisterViewMixin on State<RegisterView> {
  late final TextEditingController fullNameController;
  late final TextEditingController phoneController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  late final GlobalKey<FormState> formKey;
  late final RegisterViewModel registerViewModel;

  @override
  void initState() {
    registerViewModel = RegisterViewModel();
    fullNameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }
}
