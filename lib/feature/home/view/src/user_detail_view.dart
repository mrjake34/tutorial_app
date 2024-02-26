import 'package:easy_localization/easy_localization.dart';

import '../../../../product/utils/localization/locale_keys.g.dart';
import '../index.dart';

/// Kullanıcı detaylarının gösterildiği sayfa
/// Kullanıcı bilgileri [User] sınıfından alınır.
/// [user] parametresi boş olamaz.
/// bu sebeple required olarak belirtilmiştir.
/// [User] sınıfı içerisindeki bilgiler gösterilir.
/// Bir önceki sayfada kullanıcıın null olma durumu kontrol edilmiştir.
/// Bu sebeple bu sayfada tekrar kontrol edilmesine gerek yoktur.
final class UserDetailView extends StatelessWidget {
  const UserDetailView({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name ?? ''),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              /// [LocaleKeys] sınıfı içerisindeki anahtarlar getirilir.
              /// bu anahtarlar json dosyasındaki değerlerin anahtarlarıdır.
              /// [tr()] metodu ile çeviri yapılır.
              /// bu metot çeviriyi yaparken kendi içerisinde ki provider'ı kullanır.
              /// bu sebeple [EasyLocalization] sınıfının yapıcı metoduna [child] parametresi verilir.
              /// bu parametre ile çeviri yapılacak olan widget sarılır.
              /// bu sayede çeviri yapılırken, çeviri yapılacak olan widget'ın state'i değiştiğinde
              /// çeviri yapılır ve widget'ın state'i güncellenir.
              /// [tr()] metodunun kullanıldığı yerlerde state güncellenmesi olacağı için
              /// kullanılan widget'lar const olmamalıdır.
              title: Text(LocaleKeys.userTexts_name.tr()),

              /// [LocaleKeys] sınıfı içerisindeki anahtarlar kullanılarak çeviri yapılır.
              /// [args] parametresi ile çeviri yapılırken kullanılacak olan parametreler belirtilir.
              /// bu parametreler, json dosyasındaki {} gibi yer tutucuların yerine geçer.
              subtitle: Text(LocaleKeys.args_name.tr(args: [user.name ?? ''])),
            ),
            ListTile(
              title: const Text('Username'),
              subtitle: Text(user.username ?? ''),
            ),
            ListTile(
              title: Text(LocaleKeys.userTexts_email.tr()),
              subtitle: Text(user.email ?? ''),
            ),
            ListTile(
              title: Text(LocaleKeys.userTexts_phone.tr()),
              subtitle: Text(user.phone ?? ''),
            ),
            ListTile(
              title: Text(LocaleKeys.userTexts_website.tr()),
              subtitle: Text(user.website ?? ''),
            ),
            ListTile(
              title: Text(LocaleKeys.userTexts_company.tr()),
              subtitle: Text(user.company?.name ?? ''),
            ),
            ListTile(
              title: Text(LocaleKeys.userTexts_address.tr()),
              subtitle: Text(user.address?.street ?? ''),
            ),
            ListTile(
              title: Text(LocaleKeys.userTexts_city.tr()),
              subtitle: Text(user.address?.city ?? ''),
            ),
            ListTile(
              title: Text(LocaleKeys.userTexts_zipcode.tr()),
              subtitle: Text(user.address?.zipcode ?? ''),
            ),
            ListTile(
              trailing: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MapsView(
                        latitude: double.parse(user.address?.geo?.lat ?? '0'),
                        longitude: double.parse(user.address?.geo?.lng ?? '0'),
                        title: user.name ?? '',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.map),
              ),
              title: Text(LocaleKeys.userTexts_geo.tr()),
              subtitle: Text(
                  '${user.address?.geo?.lat ?? ''}, ${user.address?.geo?.lng ?? ''}'),
            ),
          ],
        ),
      ),
    );
  }
}
