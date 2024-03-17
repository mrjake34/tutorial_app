part of 'profile_view.dart';

mixin ProfileViewMixin on State<ProfileView> {
  late final ProfileViewModel _profileViewModel;
  @override
  void initState() {
    _profileViewModel = ProfileViewModel();
    super.initState();
  }
}
