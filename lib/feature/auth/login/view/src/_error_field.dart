part of '../login_view.dart';

final class _ErrorField extends StatelessWidget {
  const _ErrorField();

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.error?.isEmpty ?? true) {
          return const SizedBox.shrink();
        }
        return ColoredBox(
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                viewModel.error ?? '',
                style: const TextStyle(color: Colors.white),
              ).tr(),
            ],
          ),
        );
      },
    );
  }
}
