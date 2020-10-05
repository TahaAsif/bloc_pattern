import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:bloc_pattern/model/gallery_images.dart';
import 'package:bloc_pattern/ui/screens/second_page.dart';

class CustomSingleAlbumItem extends StatelessWidget {
  final Map<dynamic, List<GalleryImages>> albumData;
  final int index;

  CustomSingleAlbumItem(this.albumData, this.index);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(albumData[index][0].url),
                fit: BoxFit.cover)),
        child: Center(
          child: ClipRect(
            child: SizedBox(
              height: 200.0,
              width: 200.0,
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5.0,
                  sigmaY: 5.0,
                ),
                child: Center(
                  child: Text(
                    'Album  Number ' + albumData[index][0].albumId.toString(),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecondPage(albumData[index])),
        );
      },
    );
  }
}
