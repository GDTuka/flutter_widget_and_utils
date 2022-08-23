import 'package:photo_manager/photo_manager.dart';

class PhotoPickerModel {
  PhotoPickerModel(this.isSelected, this.entity, this.selectedIndex);
  bool isSelected;
  AssetEntity entity;
  int selectedIndex;
}
