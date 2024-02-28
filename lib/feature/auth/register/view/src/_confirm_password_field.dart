part of '../register_view.dart';

final class _ConfirmPasswordField extends StatelessWidget {
  const _ConfirmPasswordField({
    required this.confirmPasswordController,
    required this.passwordController,
  });

  final TextEditingController confirmPasswordController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
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
    );
  }
}
