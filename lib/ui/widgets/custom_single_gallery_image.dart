import 'package:flutter/material.dart';
import 'package:bloc_pattern/model/gallery_images.dart';

class CustomSingleGalleryImage extends StatelessWidget {
  final GalleryImages data;

  CustomSingleGalleryImage(this.data);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      this.data.url,
    );
  }
}
