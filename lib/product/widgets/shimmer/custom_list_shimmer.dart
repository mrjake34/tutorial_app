import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomListShimmer extends StatelessWidget {
  const CustomListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 193, 193, 193),
      highlightColor: Colors.white,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Container(
                color: Colors.grey,
                height: 20,
              ),
              subtitle: Container(
                color: Colors.grey,
                height: 20,
              ),
              trailing: Container(
                color: Colors.grey,
                height: 20,
                width: 20,
              ),
            ),
          );
        },
      ),
    );
  }
}
