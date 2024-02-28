part of '../login_view.dart';

final class _PasswordField extends StatelessWidget {
  const _PasswordField({
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      name: 'password',
      controller: passwordController,
      label: 'Password',
      obscureText: true,
      validators: [
        FormBuilderValidators.required(errorText: 'Password is required'),
        FormBuilderValidators.minLength(6,
            errorText: 'Password must be at least 6 characters'),
      ],
    );
  }
}
