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
              title: const Text('Name'),
              subtitle: Text(user.name ?? ''),
            ),
            ListTile(
              title: const Text('Username'),
              subtitle: Text(user.username ?? ''),
            ),
            ListTile(
              title: const Text('Email'),
              subtitle: Text(user.email ?? ''),
            ),
            ListTile(
              title: const Text('Phone'),
              subtitle: Text(user.phone ?? ''),
            ),
            ListTile(
              title: const Text('Website'),
              subtitle: Text(user.website ?? ''),
            ),
            ListTile(
              title: const Text('Company'),
              subtitle: Text(user.company?.name ?? ''),
            ),
            ListTile(
              title: const Text('Address'),
              subtitle: Text(user.address?.street ?? ''),
            ),
            ListTile(
              title: const Text('City'),
              subtitle: Text(user.address?.city ?? ''),
            ),
            ListTile(
              title: const Text('Zipcode'),
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
              title: const Text('Geo'),
              subtitle: Text(
                  '${user.address?.geo?.lat ?? ''}, ${user.address?.geo?.lng ?? ''}'),
            ),
          ],
        ),
      ),
    );
  }
}
