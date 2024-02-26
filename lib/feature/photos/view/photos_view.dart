import 'dart:io';

import 'package:tutorial_app/feature/home/view/index.dart';

import '../view_model/ptohos_view_model.dart';

class PhotosView extends StatelessWidget {
  const PhotosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext context) => PhotosViewModel()
          ..getPhotos(
            0,
            10,
          ),
        child: Consumer<PhotosViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.statusCode != HttpStatus.ok) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            return Column(
              children: [
                Flexible(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: viewModel.data?.photos?.length ?? 0,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                viewModel.data?.photos?[index].url ?? ''),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  color: Theme.of(context).colorScheme.surfaceBright,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              viewModel.getPhotos(
                                0,
                                10,
                              );
                            },
                            icon: const Icon(Icons.first_page),
                          ),
                          IconButton(
                            onPressed: () {
                              if ((viewModel.data?.offset ?? 0) - 10 < 0) {
                                return;
                              }
                              viewModel.getPhotos(
                                (viewModel.data?.offset ?? 0) - 10,
                                (viewModel.data?.limit ?? 10) - 10,
                              );
                            },
                            icon: const Icon(Icons.arrow_back),
                          ),
                        ],
                      ),
                      Text(
                        '${viewModel.data?.offset ?? 0} - ${(viewModel.data?.limit ?? 10)}',
                      ),
                      IconButton(
                        onPressed: () {
                          viewModel.getPhotos(
                            (viewModel.data?.offset ?? 0) + 10,
                            (viewModel.data?.limit ?? 10) + 10,
                          );
                        },
                        icon: const Icon(Icons.arrow_forward),
                      ),
                      const SizedBox.shrink()
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
