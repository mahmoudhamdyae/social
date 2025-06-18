import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../navigation/navigate_util.dart';
import '../../utils/image_model.dart';
import '../custom_loading.dart';

class ImageViewerScreen extends StatefulWidget {
  final ImageModel imageModel;

  const ImageViewerScreen({
    super.key,
    required this.imageModel,
  });

  @override
  State<ImageViewerScreen> createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState extends State<ImageViewerScreen> {
  late final PageController _pageController;
  bool _showAppBar = true;

  @override
  void initState() {
    _pageController = PageController(initialPage: widget.imageModel.index);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _showAppBar = !_showAppBar;
              });
            },
            child: PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: widget.imageModel.isFile
                      ? FileImage(File(widget.imageModel.images[index]))
                  as ImageProvider
                      : NetworkImage(widget.imageModel.images[index]),
                );
              },
              itemCount: widget.imageModel.images.length,
              loadingBuilder: (context, event) => Center(
                child: ImageLoading(),
              ),
              pageController: _pageController,
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 100),
            left: 0,
            right: 0,
            top: _showAppBar ? 0 : -(100 + MediaQuery.paddingOf(context).top),
            child: AppBar(
              systemOverlayStyle: _showAppBar
                  ? const SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
              )
                  : null,
              backgroundColor: Colors.white10,
              leading: IconButton(
                  onPressed: () {
                    NavigateUtil.navigateUp(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}