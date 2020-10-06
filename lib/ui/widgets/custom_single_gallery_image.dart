import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:bloc_pattern/model/gallery_images.dart';

class CustomSingleGalleryImage extends StatelessWidget {
  final GalleryImages data;

  CustomSingleGalleryImage(this.data);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: this.data.url,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => new Icon(Icons.error),
    );
  }
}
