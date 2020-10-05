import 'package:flutter/material.dart';
import 'package:bloc_pattern/model/gallery_images.dart';
import "package:collection/collection.dart";
import 'package:bloc_pattern/ui/widgets/single_album_item.dart';

class MyGallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
        stream: null,
        builder: (context, AsyncSnapshot<List<GalleryImages>> snapshot) {
          if (snapshot.hasData) {
            return _buildImages(snapshot.data);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Widget _buildImages(List<GalleryImages> data) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: buildAlbum(data),
      ),
    );
  }

  Widget buildAlbum(List<GalleryImages> data) {
    var groupByAlbum = groupBy(data, (obj) => obj.albumId);

    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("My Gallery"),
          ),
          body: new Card(
            elevation: 10,
            child: new Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              child: GridView.builder(
                  itemCount: groupByAlbum.length,
                  gridDelegate:
                      // crossAxisCount stands for number of columns you want for displaying
                      SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 15),
                  itemBuilder: (BuildContext context, int index) {
                    return CustomSingleAlbumItem(groupByAlbum,index+1);
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
