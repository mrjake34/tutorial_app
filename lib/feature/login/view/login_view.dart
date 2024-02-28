import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tutorial_app/feature/home/view/index.dart';
import 'package:tutorial_app/product/utils/snackbar/custom_snackbar.dart';
import '../view_model/login_view_model.dart';
import 'src/login_view_mixin.dart';

part 'src/_login_button.dart';

final class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with LoginViewMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (context) => LoginViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: FormBuilder(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FormBuilderTextField(
                  name: 'email',
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Email is required'),
                    FormBuilderValidators.email(
                        errorText: 'Please enter a valid email'),
                  ]),
                ),
                FormBuilderTextField(
                  name: 'password',
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Password is required'),
                    FormBuilderValidators.minLength(6,
                        errorText: 'Password must be at least 6 characters'),
                  ]),
                ),
                _LoginButton(
                    formKey: formKey,
                    emailController: emailController,
                    passwordController: passwordController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
