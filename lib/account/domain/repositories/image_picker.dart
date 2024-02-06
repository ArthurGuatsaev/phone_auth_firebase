import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

mixin MyPickerImage {
  FileImage? myImage;

  Future<String> getNewImage(ImageSource source, String key) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: source);
      final path = await saveImage(image: image, key: key);
      return path;
    } catch (_) {
      return '';
    }
  }

  Future<String> saveImage({required XFile? image, required String key}) async {
    if (image == null) return '';
    final path = await getApplicationDocumentsDirectory();
    final String imgpath = path.path;
    final date = DateTime.now();
    await image.saveTo('$imgpath/${date.millisecond}.jpeg');
    return '$imgpath/${date.millisecond}.jpeg';
  }

  Future<FileImage?> getImage({required String path}) async {
    try {
      return FileImage(File(path));
    } catch (_) {
      return null;
    }
  }

  Future<void> resetImage({required List<String> productsImage}) async {
    try {} catch (_) {}
  }
}
