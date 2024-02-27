import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

final class CustomImageShimmer extends StatelessWidget {
  const CustomImageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 193, 193, 193),
      highlightColor: Colors.white,
      child: GridView.builder(
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8),
            ),
          );
        },
      ),
    );
  }
}
