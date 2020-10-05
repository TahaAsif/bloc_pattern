import 'package:flutter/material.dart';
import 'package:bloc_pattern/model/gallery_images.dart';
import 'package:bloc_pattern/ui/widgets/custom_single_gallery_image.dart';

class SecondPage extends StatelessWidget {
  final List<GalleryImages> albumData;

  SecondPage(this.albumData);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Images"),
        ),
        body: new Card(
          elevation: 10,
          child: new Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            child: GridView.builder(
                itemCount: albumData.length,
                gridDelegate:
                    // crossAxisCount stands for number of columns you want for displaying
                    SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 15),
                itemBuilder: (BuildContext context, int index) {
                  return CustomSingleGalleryImage(albumData[index]);
                }),
          ),
        ),
      ),
    );
  }
}
