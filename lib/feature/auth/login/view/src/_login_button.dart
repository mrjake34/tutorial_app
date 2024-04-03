part of '../login_view.dart';

final class _LoginButton extends StatelessWidget {
  const _LoginButton({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormBuilderState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        formKey.currentState?.save();
        if (formKey.currentState?.validate() ?? false) {
          context.read<LoginViewModel>().signInWithEmail(
                LoginRequestModel(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                ),
              );
        }
      },
      child: CustomText(LocaleKeys.buttons_submit.tr()),
    );
  }
}
