import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorial_app/feature/profile/view_model/profile_view_model.dart';

part 'profile_view_mixin.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> with ProfileViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: ChangeNotifierProvider(
          create: (context) => _profileViewModel..fetchUser(),
          child: Consumer<ProfileViewModel>(
            builder: (context, snapshot, child) {
              if (snapshot.error != null) {
                Center(
                  child: Text(snapshot.error ?? ''),
                );
              }
              return Column(
                children: [
                  ListTile(
                    title: Text(snapshot.userModel?.email ?? ''),
                  ),
                  ListTile(
                    title: Text(snapshot.userModel?.fullName ?? ''),
                  ),
                  ListTile(
                    title: Text(snapshot.userModel?.phoneNumber ?? ''),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
