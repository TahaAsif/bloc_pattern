import 'package:bloc_pattern/bloc/images_bloc.dart';
import 'package:bloc_pattern/ui/widgets/single_album_item.dart';
import 'package:bloc_pattern/utils/gloabl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:collection/collection.dart";
import 'model/gallery_images.dart';

void main() {
  runApp(MultiProvider(providers: [
    // used this multiprovider if in case in future I want to add more provider
    ChangeNotifierProvider(
      create: (_) => ImagesBloc(),
    )
  ], child: MyGallery())); // MyGallery child widgets can use this imageBloc now
}

class MyGallery extends StatefulWidget {
  @override
  _MyGalleryState createState() => _MyGalleryState();
}

class _MyGalleryState extends State<MyGallery> {
  _init(context) {

    var provider = Provider.of<ImagesBloc>(context, listen: false);
    provider.getImages();

  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) => _init(context));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Consumer<ImagesBloc>(
          builder: (context, imageBloc, child) {
            return imageBloc.state == ViewState.Idle && imageBloc?.data!=null
                ? buildAlbum(imageBloc.data)
                : Center(child: CircularProgressIndicator());
          },
        ));
  }

  Widget buildAlbum(List<GalleryImages> data) {
    var groupByAlbum = groupBy(data, (obj) => obj.albumId);

    return Scaffold(
      appBar: AppBar(
        title: Text("My Gallery"),
      ),
      body: SafeArea(
        child: new Card(
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
                  return CustomSingleAlbumItem(groupByAlbum, index + 1);
                }),
          ),
        ),
      ),
    );
  }
}
