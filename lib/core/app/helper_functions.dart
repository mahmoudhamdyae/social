import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';


class HelperFunctions {
  const HelperFunctions._();

  static showToastMessage(
      BuildContext context,
      String message, {
        int duration = 2,
      }) {
    ToastContext().init(context);
    Toast.show(
      message,
      textStyle: TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      duration: duration,
      gravity: Toast.bottom,
    );
  }

  static Future<Either<String, File?>> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image =
      await picker.pickImage(source: source, imageQuality: 80);
      if (image != null) {
        return Right(File(image.path));
      }
      return const Right(null);
    } catch (error) {
      return Left(error.toString());
    }
  }

  static Future<Either<String, List<File>>> pickFiles({
    BuildContext? context,
    List<String>? allowedExtensions,
    bool allowMultiple = false,
  }) async {
    try {
      List<File> files = [];

      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowedExtensions: allowedExtensions,
        type: allowedExtensions == null ? FileType.any : FileType.custom,
        allowMultiple: allowMultiple,
        onFileLoading: (status) {
          if (context != null) {
            if (status == FilePickerStatus.picking) {
              // showAppDialog(
              //   context,
              //   child: const FetchLoading(
              //     color: Colors.white,
              //   ),
              // );
            } else {
              if (ModalRoute.of(context)?.isCurrent != true) {
                Navigator.pop(context);
              }
            }
          }
        },
      );
      if (result != null) {
        for (var file in result.files) {
          if (file.path != null) {
            files.add(File(file.path!));
          }
        }
      }
      return Right(files);
    } catch (error) {
      return Left(error.toString());
    }
  }
}