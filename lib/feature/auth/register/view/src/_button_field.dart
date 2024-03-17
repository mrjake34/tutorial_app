part of '../register_view.dart';

final class _ButtonField extends StatelessWidget {
  const _ButtonField({
    required this.formKey,
    required this.registerRequestModel,
  });

  final GlobalKey<FormState> formKey;
  final RegisterRequestModel registerRequestModel;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        formKey.currentState?.save();
        if (formKey.currentState?.validate() ?? false) {
          context.read<RegisterViewModel>().register(registerRequestModel);
        }
      },
      child: const Text('Register'),
    );
  }
}
