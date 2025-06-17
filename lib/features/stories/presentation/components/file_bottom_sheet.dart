import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/app/helper_functions.dart';
import '../../../../core/navigation/navigate_util.dart';

class FileBottomSheet extends StatelessWidget {
  final Function(File file) onUpdated;
  final bool uploadOnlyImage;
  final bool showCamera;

  const FileBottomSheet({
    super.key,
    required this.onUpdated,
    this.uploadOnlyImage = true,
    this.showCamera = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 32,
        right: 32,
        top: 33,
        bottom: 47,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // SvgPicture.asset(
          //   SvgImages.line,
          //   width: 54.w,
          //   height: 5.h,
          // ),
          // SizedBox(
          //   height: 47.h,
          // ),
          Text(
            showCamera
                ? 'Choose image source'
                : 'Attach the file',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          SizedBox(
            height: showCamera ? 57 : 20,
          ),
          if (showCamera)
            _OutlineButton(
              onPressed: () {
                HelperFunctions.pickImage(ImageSource.camera).then((value) {
                  NavigateUtil.navigateUp(context);
                  value.fold((failure) {
                    HelperFunctions.showToastMessage(context, failure);
                  }, (file) {
                    if (file != null) {
                      onUpdated(file);
                    }
                  });
                });
              },
              color: Theme.of(context).colorScheme.secondary,
              title: 'Camera',
            ),
          SizedBox(
            height: 24,
          ),
          _OutlineButton(
            onPressed: () {
              if (uploadOnlyImage) {
                HelperFunctions.pickImage(ImageSource.gallery).then((value) {
                  NavigateUtil.navigateUp(context);
                  value.fold((failure) {
                    HelperFunctions.showToastMessage(context, failure);
                  }, (file) {
                    if (file != null) {
                      onUpdated(file);
                    }
                  });
                });
              } else {
                HelperFunctions.pickFiles().then((value) {
                  NavigateUtil.navigateUp(context);
                  value.fold((failure) {
                    HelperFunctions.showToastMessage(context, failure);
                  }, (files) {
                    if (files.isNotEmpty) {
                      onUpdated(files.first);
                    }
                  });
                });
              }
            },
            color: Theme.of(context).primaryColor,
            title: uploadOnlyImage
                ? 'Gallery'
                : 'Files',
          ),
        ],
      ),
    );
  }
}

class _OutlineButton extends StatelessWidget {
  final Function() onPressed;
  final Color color;
  final String title;

  const _OutlineButton({
    required this.onPressed,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: BorderSide(
            color: color,
          ),
          elevation: 2,
          shadowColor: color,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: color,
          ),
        ),
      ),
    );
  }
}