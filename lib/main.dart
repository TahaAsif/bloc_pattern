import 'package:bloc_pattern/bloc/images_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
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

  _init(context) async{
 
    var provider = Provider.of<ImagesBloc>(context,listen: false);

    try{
        var response = await provider.getImages();
        print(response);
    }
    catch(e)
    {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:null,
    );
  }
}
