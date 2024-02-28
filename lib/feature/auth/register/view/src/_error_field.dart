part of '../register_view.dart';

final class _ErrorField extends StatelessWidget {
  const _ErrorField();

  @override
  Widget build(BuildContext context) {
    return Selector<RegisterViewModel, String>(
      builder: (context, error, child) {
        return Text(error);
      },
      selector: (context, viewModel) => viewModel.registerError ?? '',
    );
  }
}
