part of '../register_view.dart';

final class _ButtonField extends StatelessWidget {
  const _ButtonField({
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        formKey.currentState?.save();
        if (formKey.currentState?.validate() ?? false) {
          print('Register');
        }
      },
      child: const Text('Register'),
    );
  }
}
