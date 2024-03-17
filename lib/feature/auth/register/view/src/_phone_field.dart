part of '../register_view.dart';

final class _PhoneField extends StatelessWidget {
  const _PhoneField({
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      name: 'Phone',
      controller: emailController,
      label: 'Phone',
      validators: [
        FormBuilderValidators.required(errorText: 'Phone is required'),
        FormBuilderValidators.integer(errorText: 'Required as number')
      ],
    );
  }
}
