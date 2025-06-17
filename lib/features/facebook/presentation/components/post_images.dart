import 'package:flutter/material.dart';
import 'package:social/core/extensions/num_extensions.dart';

import '../../../../core/components/cached_image.dart';

class PostImages extends StatelessWidget {
  final List<String> images;
  const PostImages({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    final int imageCount = images.length;
    const double spacing = 2;
    const double totalHeight = 250;

    if (imageCount == 1) {
      return _buildSingleImage(images[0]);
    } else if (imageCount == 2) {
      return Row(
        spacing: spacing,
        children: images
            .map((url) => Expanded(child: _buildImage(url)))
            .toList(),
      );
    } else if (imageCount == 3) {
      return SizedBox(
        height: totalHeight,
        child: Row(
          children: [
            Expanded(flex: 2, child: _buildImage(images[0])),
            spacing.pw,
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(child: _buildImage(images[1])),
                  spacing.ph,
                  Expanded(child: _buildImage(images[2])),
                ],
              ),
            )
          ],
        ),
      );
    } else {
      final int shownImages = imageCount > 4 ? 4 : imageCount;
      return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: shownImages,
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
        ),
        itemBuilder: (context, index) {
          if (index == 3 && imageCount > 4) {
            return Stack(
              fit: StackFit.expand,
              children: [
                _buildImage(images[index]),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.black45,
                  ),
                  child: Center(
                    child: Text(
                      '+${imageCount - 4}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            );
          }
          return _buildImage(images[index]);
        },
      );
    }
  }

  Widget _buildSingleImage(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedImage(imageUrl: url, fit: BoxFit.cover),
    );
  }

  Widget _buildImage(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: CachedImage(
        imageUrl: url,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
