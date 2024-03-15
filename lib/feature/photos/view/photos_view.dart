import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorial_app/product/utils/localization/locale_keys.g.dart';
import 'package:tutorial_app/product/widgets/shimmer/custom_image_shimmer.dart';

import '../view_model/ptohos_view_model.dart';

part 'src/_photos_gridview_builder.dart';

final class PhotosView extends StatelessWidget {
  const PhotosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.photos_title.tr()),
      ),
      body: ChangeNotifierProvider<PhotosViewModel>(
        create: (BuildContext context) => PhotosViewModel()
          ..getPhotos(
            0,
            10,
          ),
        child: Consumer<PhotosViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.statusCode != HttpStatus.ok) {
              return const Center(
                child: CustomImageShimmer(),
              );
            }
            return _PhotosGridViewBuilder(viewModel);
          },
        ),
      ),
    );
  }
}
