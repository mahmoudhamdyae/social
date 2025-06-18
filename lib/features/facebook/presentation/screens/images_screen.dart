import 'package:flutter/material.dart';
import 'package:social/core/components/cached_image.dart';
import 'package:social/core/extensions/num_extensions.dart';

class ImagesScreen extends StatelessWidget {

  final List<String> images;

  const ImagesScreen({
    super.key,
    required this.images
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: images.length,
      separatorBuilder: (BuildContext context, int index) => 16.ph,
      itemBuilder: (BuildContext context, int index) {
        return CachedImage(
            imageUrl: images[index]
        );
      },
    );
  }
}
