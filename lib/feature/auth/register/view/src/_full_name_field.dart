part of '../register_view.dart';

final class _FullNameField extends StatelessWidget {
  const _FullNameField({
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      name: 'FullName',
      controller: emailController,
      label: 'FullName',
      validators: [
        FormBuilderValidators.required(errorText: 'FullName is required'),
      ],
    );
  }
}
