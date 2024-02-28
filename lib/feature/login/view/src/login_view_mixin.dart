import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:tutorial_app/feature/login/view/login_view.dart';
import '../../../home/view/index.dart';

mixin LoginViewMixin on State<LoginView> {
  late final GlobalKey<FormBuilderState> formKey;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    formKey = GlobalKey<FormBuilderState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }
}
