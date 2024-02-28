part of '../home_view.dart';

final class _ListViewBuilder extends StatelessWidget {
  const _ListViewBuilder({
    required this.users,
  });

  /// Kullanıcı listesi
  /// Bu liste nullable değildir.
  /// Listenin boş olma durumu kontrol edilmiştir.
  /// Eğer liste boş ise bir önceki sayfada bu widget çalışmayacağı için
  /// kontrol edilmesine gerek yoktur.
  final List<UserModel> users;

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
