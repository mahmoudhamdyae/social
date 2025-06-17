import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../navigation/navigate_util.dart';
import '../resources/assets_manager.dart';
import '../utils/image_model.dart';
import 'custom_loading.dart';
import 'screens/image_viewer_screen.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final int? memCacheWidth;
  final int? memCacheHeight;
  final double? radius;
  final bool enableTopLeftRadius;
  final bool enableTopRightRadius;
  final bool enableBottomLeftRadius;
  final bool enableBottomRightRadius;
  final BoxFit? fit;
  final bool enableTap;
  final bool enableShadow;

  const CachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.memCacheWidth,
    this.memCacheHeight,
    this.radius,
    this.enableTopLeftRadius = true,
    this.enableTopRightRadius = true,
    this.enableBottomLeftRadius = true,
    this.enableBottomRightRadius = true,
    this.fit,
    this.enableTap = true,
    this.enableShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    final heightValue = height == width ? height : height;
    final double radiusValue = radius ?? 0;
    return GestureDetector(
      onTap: enableTap
          ? () {
        if (imageUrl.isNotEmpty) {
          NavigateUtil.navigateToScreen(
              context,
              ImageViewerScreen(imageModel: ImageModel(images: [imageUrl]))
          );
        }
      }
          : null,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(enableTopLeftRadius ? radiusValue : 0),
            topRight: Radius.circular(enableTopRightRadius ? radiusValue : 0),
            bottomLeft:
            Radius.circular(enableBottomLeftRadius ? radiusValue : 0),
            bottomRight:
            Radius.circular(enableBottomRightRadius ? radiusValue : 0),
          ),
          color: enableShadow ? Colors.white : Colors.transparent,
          boxShadow: enableShadow
              ? [
            BoxShadow(
              blurRadius: 4,
              color: Colors.black,
            )
          ]
              : null,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(enableTopLeftRadius ? radiusValue : 0),
            topRight: Radius.circular(enableTopRightRadius ? radiusValue : 0),
            bottomLeft:
            Radius.circular(enableBottomLeftRadius ? radiusValue : 0),
            bottomRight:
            Radius.circular(enableBottomRightRadius ? radiusValue : 0),
          ),
          child: imageUrl.isEmpty
              ? SvgPicture.asset(
            SvgManager.noImage,
            height: heightValue,
            width: width,
            fit: BoxFit.fill,
          )
              : CachedNetworkImage(
            imageUrl: imageUrl,
            fit: fit ?? BoxFit.cover,
            height: heightValue,
            width: width,
            memCacheWidth: memCacheWidth,
            memCacheHeight: memCacheHeight,
            placeholder: (context, _) => const ImageLoading(),
            errorWidget: (context, _, __) {
              return FittedBox(
                child: Icon(
                  Icons.image,
                  size: 100,
                  color: Colors.white,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}