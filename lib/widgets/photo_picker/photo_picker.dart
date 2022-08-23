import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_utils_and_widgets/widgets/photo_picker/photo_picker_model.dart';
import 'package:flutter_utils_and_widgets/widgets/photo_picker/photo_picker_widget.dart';
import 'package:photo_manager/photo_manager.dart';

class PhotoPicker {
  static Future<List<File>> getPhotos({
    required BuildContext context,
    int maxPhotos = 1,
  }) async {
    final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList();
    List<PhotoPickerModel> photos = [];

    if (paths.isNotEmpty) {
      AssetPathEntity path = paths.first;
      List<AssetEntity> entityes = await path.getAssetListPaged(page: 0, size: 120);

      for (AssetEntity entity in entityes) {
        photos.add(PhotoPickerModel(false, entity, 0));
      }

      final List<File>? res = await showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) {
            return PhotoPickerWidget(
              photos: photos,
              maxPhotos: maxPhotos,
            );
          });

      if (res == null) {
        return [];
      }
      return res;
    } else {
      final List<File>? res = await showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) {
            return PhotoPickerWidget(
              photos: photos,
              maxPhotos: maxPhotos,
            );
          });
      if (res == null) {
        return [];
      }
      return res;
    }
  }
}
