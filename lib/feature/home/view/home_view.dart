import 'index.dart';

final class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeViewModel()..setUsers(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Consumer<HomeViewModel>(builder: (context, viewModel, child) {
          if (viewModel.users != null && viewModel.users!.isNotEmpty) {
            /// [ListViewBuilder] sınıfı ile kullanıcı listesi gösterilir.
            /// [users] parametresi ile kullanıcı listesi alınır.
            return ListViewBuilder(users: viewModel.users!);
          } else if (viewModel.error != null) {
            return Center(
              child: Text(viewModel.error ?? ''),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
