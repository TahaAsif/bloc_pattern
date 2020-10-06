import 'package:bloc_pattern/model/gallery_images.dart';
import 'package:bloc_pattern/service_handler/service_handler.dart';
import 'package:bloc_pattern/utils/gloabl.dart';
import 'package:flutter/cupertino.dart';

class ImagesBloc extends ChangeNotifier {
  
  ViewState _state = ViewState.Idle;
  ServiceHandler serviceHandler = ServiceHandler();

  List<GalleryImages> _data;


  _setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  ViewState get state => _state;

  List<GalleryImages> get data => _data;

  Future<void> getImages() async {
    _setState(ViewState.Busy);
    try {
      _data = await serviceHandler.fetchData();
       _setState(ViewState.Idle);
    } catch (e) {
      _setState(ViewState.Idle);
      print(e);
    }
  }
}

final imagesBloc = ImagesBloc();
