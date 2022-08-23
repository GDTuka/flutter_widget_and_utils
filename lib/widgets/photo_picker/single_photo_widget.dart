import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class SinglePhotoWidget extends StatefulWidget {
  const SinglePhotoWidget({
    Key? key,
    required this.entity,
    required this.index,
  }) : super(key: key);

  final AssetEntity entity;
  final int index;
  @override
  State<SinglePhotoWidget> createState() => _SinglePhotoWidgetState();
}

class _SinglePhotoWidgetState extends State<SinglePhotoWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: Stack(
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: AssetEntityImage(
              widget.entity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 8),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Align(
                  child: Text('${widget.index}'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
