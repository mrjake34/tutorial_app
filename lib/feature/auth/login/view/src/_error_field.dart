part of '../login_view.dart';

final class _ErrorField extends StatelessWidget {
  const _ErrorField();

  @override
  Widget build(BuildContext context) {
    return Selector<LoginViewModel, String>(
      selector: (context, model) => model.error ?? '',
      builder: (context, error, child) {
        return Text(
          error,
        ).tr();
      },
    );
  }
}
