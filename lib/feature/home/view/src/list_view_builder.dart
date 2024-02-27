import 'package:go_router/go_router.dart';

import '../../../../product/utils/router/route_params.dart';
import '../../../../product/utils/router/route_paths.dart';
import '../index.dart';

final class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({
    super.key,

    /// Bir önceki sayfada nullable olmayan bir liste gönderildiği için
    /// bu parametrenin required olarak belirtilmesi gerekmektedir.
    required this.users,
  });

  /// Kullanıcı listesi
  /// Bu liste nullable değildir.
  /// Listenin boş olma durumu kontrol edilmiştir.
  /// Eğer liste boş ise bir önceki sayfada bu widget çalışmayacağı için
  /// kontrol edilmesine gerek yoktur.
  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      itemCount: users.length,
      itemBuilder: (context, index) {
        /// Kullanıcı listesi içerisindeki her bir kullanıcı için bir [Card] oluşturulur.
        /// [Card] içerisinde [ListTile] oluşturulur.
        /// [ListTile] içerisinde kullanıcı bilgileri gösterilir.
        /// [user] parametresi her bir kullanıcıyı temsil eder.
        /// ListView.builder'dan gelen index değeri her bir kullanıcı için kullanılır.
        final user = users[index];
        return Card(
          child: ListTile(
            /// Kullanıcı adı null olma durumunda boş bir string gösterilir.
            onTap: () {
              context.push(
                RoutePaths.userDetail.path,
                extra: user,
              );
            },
            title: Text(user.name ?? ''),
            subtitle: Text(user.email ?? ''),
            trailing: Text(user.address?.city ?? ''),
          ),
        );
      },
    );
  }
}
