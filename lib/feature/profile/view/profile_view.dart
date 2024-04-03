import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorial_app/feature/auth/login/view_model/login_view_model.dart';
import 'package:tutorial_app/feature/profile/model/profile_model.dart';
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
      appBar: AppBar(title: const Text('Profile')),
      body: SingleChildScrollView(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => _profileViewModel..fetchUser(),
            ),
            ChangeNotifierProvider(
              create: (context) => LoginViewModel(),
            )
          ],
          child: Column(
            children: [
              Consumer<ProfileViewModel>(
                builder: (context, snapshot, child) {
                  if (snapshot.error != null) {
                    return Center(child: Text(snapshot.error ?? ''));
                  } else if (snapshot.userModel != null) {
                    return ProfileField(userModel: snapshot.userModel!);
                  } else {
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const _LogoutButton()
            ],
          ),
        ),
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          context.read<LoginViewModel>().logout();
          await context.read<ProfileViewModel>().logout();
        },
        child: const Text('Logout'));
  }
}

class ProfileField extends StatelessWidget {
  const ProfileField({
    super.key,
    required this.userModel,
  });

  final ProfileModel userModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(userModel.email ?? ''),
        ),
        ListTile(
          title: Text(userModel.fullName ?? ''),
        ),
        ListTile(
          title: Text(userModel.phoneNumber ?? ''),
        ),
      ],
    );
  }
}
