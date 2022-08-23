import 'package:flutter/material.dart';
import 'package:flutter_utils_and_widgets/widgets/photo_picker/photo_picker_model.dart';
import 'package:flutter_utils_and_widgets/widgets/photo_picker/single_photo_widget.dart';
import 'package:photo_manager/photo_manager.dart';

class PhotoPickerWidget extends StatefulWidget {
  const PhotoPickerWidget({
    Key? key,
    required this.photos,
    required this.maxPhotos,
  }) : super(key: key);

  final List<PhotoPickerModel> photos;
  final int maxPhotos;
  @override
  State<PhotoPickerWidget> createState() => _PhotoPickerWidgetState();
}

class _PhotoPickerWidgetState extends State<PhotoPickerWidget> {
  List<PhotoPickerModel> get photos => widget.photos;

  List<AssetEntity> pickedPhotos = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: GridView.custom(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          childrenDelegate: SliverChildBuilderDelegate(childCount: photos.length, (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (photos[index].isSelected) {
                    photos[index].isSelected = false;
                    pickedPhotos.removeAt(pickedPhotos.indexOf(photos[index].entity));
                  } else {
                    photos[index].isSelected = true;
                    pickedPhotos.add(photos[index].entity);
                  }
                });
              },
              child: Column(
                children: [
                  if (photos[index].isSelected)
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: AssetEntityImage(
                              photos[index].entity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                              alignment: Alignment.topRight,
                              child: SinglePhotoWidget(
                                entity: photos[index].entity,
                                index: pickedPhotos.indexOf(photos[index].entity) + 1,
                              ))
                        ],
                      ),
                    )
                  else
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: AssetEntityImage(
                        photos[index].entity,
                        fit: BoxFit.cover,
                      ),
                    ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
