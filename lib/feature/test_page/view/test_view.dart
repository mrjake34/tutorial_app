import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorial_app/feature/test_page/view_model/test_view_model.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TestViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Test View'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Expanded(child: _GetConfigValueButton()),
              Expanded(
                flex: 5,
                child: Consumer<TestViewModel>(
                  builder: (context, state, _) {
                    if (state.getCommentList == null) return Container();
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.getCommentList?.length,
                        itemBuilder: (context, index) {
                          final comment = state.getCommentList?[index];
                          if (comment != null) {
                            return Text(comment.body ?? '');
                          }
                          return Container();
                        });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _GetConfigValueButton extends StatelessWidget {
  const _GetConfigValueButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => context.read<TestViewModel>().getConfigValue(),
        child: const Text('Get Quests'));
  }
}
