import 'index.dart';

final class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    /// [ChangeNotifierProvider] sınıfı ile [HomeViewModel] sınıfı kullanılır.
    /// [HomeViewModel] sınıfı, kullanıcı listesi getirme işlemleri yapar.
    /// [HomeViewModel] sınıfı widget ağacına burada eklenir.
    /// Sadece içerisinde [HomeView] da gösterilecek değerler olduğu için
    /// burada oluşturulması en uygun yerdir.
    /// [create] parametresi ile [HomeViewModel] sınıfı oluşturulur.
    /// [HomeViewModel] sınıfı içerisinde [setUsers] metodu ile kullanıcı listesi getirilir.
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeViewModel()..setUsers(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),

        /// Consumer sınıfı ile [HomeViewModel] sınıfı dinlenir.
        /// [HomeViewModel] sınıfı içerisindeki [users] ve [error] değişkenleri dinlenir.
        /// [users] değişkeni içerisinde kullanıcı listesi varsa, [ListViewBuilder] sınıfı ile kullanıcı listesi gösterilir.
        /// [error] değişkeni içerisinde hata varsa, hata mesajı gösterilir.
        /// [users] ve [error] değişkenleri null ise, yükleniyor gösterilir.
        /// [HomeViewModel] sınıfı içerisindeki [users] ve [error] değişkenleri değiştiğinde, bu widget yeniden oluşturulur.
        /// [Consumer] sınıfı [Provider] paketinden gelir.
        body: Consumer<HomeViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.users != null && viewModel.users!.isNotEmpty) {
              /// [ListViewBuilder] sınıfı ile kullanıcı listesi gösterilir.
              /// [users] parametresi ile kullanıcı listesi alınır.
              /// [viewModel.users] değişkeni önceden kontrol edildiği için null olma ihtimali yoktur.
              /// fakat dart dili bunu anlamaz
              /// bu sebeple [!] işareti ile null force yapılır.
              /// Null kontrolü yapılmadığı durumlarda null foce [!] işareti yapılırsa hata alınır.
              return ListViewBuilder(users: viewModel.users!);
            } else if (viewModel.error != null) {
              return Center(
                child: Text(viewModel.error ?? ''),
              );
            }
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          },
        ),
      ),
    );
  }
}
