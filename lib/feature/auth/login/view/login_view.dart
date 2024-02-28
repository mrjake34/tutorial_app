import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tutorial_app/feature/home/view/index.dart';
import 'package:tutorial_app/product/widgets/text_field/custom_text_field.dart';
import '../model/login_request_model.dart';
import '../view_model/login_view_model.dart';
import 'src/login_view_mixin.dart';

part 'src/_login_button.dart';
part 'src/_email_field.dart';
part 'src/_error_field.dart';
part 'src/_password_field.dart';

final class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with LoginViewMixin {
  @override
  Widget build(BuildContext context) {
    /// [ChangeNotifierProvider] ile [LoginViewModel] sınıfı widget ağacına dahil edilir.
    /// Bu sayede [LoginViewModel] sınıfı içerisindeki değişiklikler dinlenerek widget ağacında yer alan
    /// widget'ların yeniden oluşturulması sağlanır.
    /// Burada tanımlamanın amacı Provider'ın olabildiğince yukarıda tanımlanmasıdır.
    /// Bu sayede [LoginViewModel] sınıfı sadece Login sayfasında kullanılmak üzere tanımlanmış olur.
    return ChangeNotifierProvider<LoginViewModel>(
      create: (context) => LoginViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: FormBuilder(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// [_EmailField] widget'ı email alanı için oluşturulmuştur.
                /// private olarak tanımlanmıştır.
                /// Bu sayede sadece bu dosya içerisinde kullanılabilir.
                /// [part] ve [part of] keyword'leri ile dosyalar birbirine bağlanmıştır.
                /// Bu sayede [_email_field.dart] dosyası bu dosya içerisinde kullanılabilir.
                /// Bu sayede kodun okunabilirliği arttırılmıştır.
                _EmailField(emailController: emailController),
                const SizedBox(height: 10),
                _PasswordField(passwordController: passwordController),
                const _ErrorField(),
                const SizedBox(height: 20),
                _LoginButton(
                  formKey: formKey,
                  emailController: emailController,
                  passwordController: passwordController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
