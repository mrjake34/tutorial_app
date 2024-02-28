part of '../register_view.dart';

final class _EmailField extends StatelessWidget {
  const _EmailField({
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      name: 'Email',
      controller: emailController,
      label: 'Email',
      validators: [
        FormBuilderValidators.required(errorText: 'Email is required'),
        FormBuilderValidators.email(errorText: 'Invalid email'),
      ],
    );
  }
}
