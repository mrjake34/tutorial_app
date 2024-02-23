import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorial_app/feature/home/view_model/home_view_model.dart';

final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    Provider.of<HomeViewModel>(context, listen: false).setUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Consumer<HomeViewModel>(builder: (context, viewModel, child) {
        if (viewModel.users == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemCount: viewModel.users?.length ?? 0,
          itemBuilder: (context, index) {
            final user = viewModel.users?[index];
            return Card(
              child: ListTile(
                title: Text(user?.name ?? ''),
                subtitle: Text(user?.email ?? ''),
                trailing: Text(user?.address?.city ?? ''),
              ),
            );
          },
        );
      }),
    );
  }
}
