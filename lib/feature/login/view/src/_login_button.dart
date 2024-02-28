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
    return Consumer<LoginViewModel>(
      builder: (context, viewModel, child) {
        return ElevatedButton(
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              viewModel.signInWithEmail(
                email: emailController.text,
                password: passwordController.text,
              );
            }
          },
          child: Text('Login'),
        );
      },
    );
  }
}
