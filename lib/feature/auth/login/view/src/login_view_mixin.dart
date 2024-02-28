import 'dart:async';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:tutorial_app/feature/auth/login/view/login_view.dart';

import '../../../../../product/utils/remote_config/remote_config_manager.dart';

/// [LoginViewMixin] sınıfı [LoginView] sınıfı içerisinde kullanılan değişkenlerin
/// ve fonksiyonların tekrar tekrar tanımlanmasını engellemek için oluşturulmuştur.
/// Bu sayede kod tekrarı engellenmiş olur.
/// Ayrıca [LoginView] sınıfının içerisindeki kodun okunabilirliği arttırılmış olur.
/// [State] sınıfının tipi olarak [LoginView] sınıfı verilmiştir.
/// Bu sayede bu mixin sınıfı sadece [LoginView] sınıfı ile kullanılabilir.
mixin LoginViewMixin on State<LoginView> {
  late final GlobalKey<FormBuilderState> formKey;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final Stream<RemoteConfigUpdate> streamSubscription;

  /// [initState] fonksiyonu [State] sınıfının bir metodu olup, bu sınıfın
  /// bir parçasıdır. Bu fonksiyon [State] sınıfı oluşturulduğunda çalıştırılır.
  /// Bu fonksiyon içerisinde [formKey], [emailController] ve [passwordController]
  /// değişkenlerine değer ataması yapılır.
  /// Bu sayede değişkenlerin değerleri bu sayfada oluşturulduğunda atanmış olur.
  /// Bunu yapmamızda ki amaç bu değişkenlerin değerlerinin sadece bu sayfa oluştuğunda
  /// atanmasını sağlamaktır. Bu sayede bu değişkenlerin kullanılmaması durumunda
  /// gereksiz bellek kullanımı engellenmiş olur.
  /// Bu fonksiyon içerisinde [super.initState()] fonksiyonu çağrılarak [State] sınıfının
  /// [initState] fonksiyonu çalıştırılır.
  /// Bu sayede [State] sınıfının [initState] fonksiyonu içerisindeki işlemler yapılır.
  /// Ve [State] sınıfının oluşturulması sağlanır.
  @override
  void initState() {
    formKey = GlobalKey<FormBuilderState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    streamSubscription = RemoteConfigManager.onConfigChanged;
    super.initState();
  }

  /// [dispose] fonksiyonu [State] sınıfının bir metodu olup, bu sınıfın
  /// bir parçasıdır. Bu fonksiyon [State] sınıfı silindiğinde çalıştırılır.
  /// Bu fonksiyon içerisinde [emailController], [passwordController] ve [formKey]
  /// değişkenlerinin bellekten temizlenmesi sağlanır.
  /// Bu sayede bu değişkenlerin gereksiz bellek kullanımı engellenmiş olur.
  /// Bu fonksiyon içerisinde [super.dispose()] fonksiyonu çağrılarak [State] sınıfının
  /// [dispose] fonksiyonu çalıştırılır.
  /// Bu sayede [State] sınıfının [dispose] fonksiyonu içerisindeki işlemler yapılır.
  /// Bu sayede [State] sınıfının bellekten temizlenmesi sağlanır.
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }
}
